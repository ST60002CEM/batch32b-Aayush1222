import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Ram Narayan'),
            subtitle: Text('ramnarayan@gmail.com'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My orders'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Shipping addresses'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment methods'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.confirmation_number),
            title: Text('Promocodes'),
            trailing: Text('You have no applied promocodes'),
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('My reviews'),
            trailing: Text('Reviews for 4 items'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: 'Favorites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
