import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // To remove the default back button
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            // Dropdown menu on the top left
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Option 1'),
                    value: 'Option 1',
                  ),
                  PopupMenuItem(
                    child: Text('Option 2'),
                    value: 'Option 2',
                  ),
                  PopupMenuItem(
                    child: Text('Option 3'),
                    value: 'Option 3',
                  ),
                ];
              },
            ),
            Spacer(), // To push the profile icon to the right
            // Profile icon on the top right
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Add functionality to open profile page
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton('Recently Added'),
                _buildFilterButton('All'),
                _buildFilterButton('New'),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  ItemCard(title: 'Acer Laptop', price: '\$450.9'),
                  ItemCard(title: "You're Not So Smart", price: '\$37.9'),
                  ItemCard(title: 'Charger', price: '\$19.9'),
                  ItemCard(title: 'Phone Case', price: '\$12.9'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 44, 44, 61),
        selectedItemColor: Color.fromARGB(255, 67, 62, 62),
        unselectedItemColor: Color.fromARGB(179, 28, 27, 27),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  ElevatedButton _buildFilterButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 44, 44, 61),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String price;

  ItemCard({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
