import 'package:all_sensors/all_sensors.dart';
import 'package:campmart/features/dashboard/presentation/view/cart_view.dart';
import 'package:campmart/features/dashboard/presentation/view/favourite_view.dart';
import 'package:campmart/features/dashboard/presentation/view/profile_view.dart';
import 'package:campmart/features/dashboard/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const HomeView(), // Home view content
    const CartView(), // Placeholder for Cart view
    const FavouriteView(), // Placeholder for Favorites view
    const ProfileView(), // Profile View
  ];
  final List<double> _accelerometerValues = [0, 0, 0];
  final double _shakeThreshold = 15.0;
 

 
  @override
  void initState() {
    super.initState();
    accelerometerEvents!.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues[0] = event.x;
        _accelerometerValues[1] = event.y;
        _accelerometerValues[2] = event.z;
      });
 
      if (_isShakeDetected(event)) {
        _showReportIssueModal();
      }
    });
  }
 
  bool _isShakeDetected(AccelerometerEvent event) {
    double magnitude = event.x * event.x + event.y * event.y + event.z * event.z;
    magnitude = magnitude / (9.81 * 9.81);
    return magnitude > _shakeThreshold;
  }
 
  void _showReportIssueModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Report a Bug or Issue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Describe the issue',
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the submit action
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Handle menu button tap
                print('Menu button tapped');
              },
            ),
            const Text(
              'CampMart',
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Handle profile button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileView()),
                );
              },
            ),
          ],
        ),
      ),
      body: _views[_selectedIndex], // Display the selected view
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 61),
        selectedItemColor: const Color.fromARGB(255, 67, 62, 62),
        unselectedItemColor: const Color.fromARGB(179, 28, 27, 27),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}
