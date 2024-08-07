import 'package:campmart/app/constants/api_endpoint.dart';
import 'package:campmart/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:campmart/features/dashboard/presentation/viewmodel/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campmart/features/dashboard/data/model/dashboard_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadMorePosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500 && !isLoading) {
      setState(() {
        isLoading = true;
      });
      _loadMorePosts();
    }
  }

  Future<void> _loadMorePosts() async {
    await ref
        .read(dashboardViewModelProvider.notifier)
        .getPosts(page: currentPage);
    setState(() {
      isLoading = false;
      currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    final state = ref.watch(dashboardViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchBar(),
                // const SizedBox(height: 10),
                // _categorySection(),
                const SizedBox(height: 10),
                _recentPostsSection(mediaSize, state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 205, 218, 228),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }

  Widget _categoryItem({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, size: 30),
        Text(label),
      ],
    );
  }



  Widget _recentPostsSection(Size mediaSize, DashboardState state) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            _scrollController.position.extentAfter == 0) {
          if (!isLoading) {
            setState(() {
              isLoading = true;
            });
            _loadMorePosts();
          }
        }
        return true;
      },
      child: SizedBox(
        height: mediaSize.height * 0.6,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: state.lstposts.length,
          itemBuilder: (context, index) {
            final post = state.lstposts[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mediaSize.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${ApiEndpoints.imageUrl}${post.productImage}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      post.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '\$${post.productPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
