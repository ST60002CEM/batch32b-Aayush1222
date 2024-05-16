import 'package:campmart/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import '../screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
      ),
      body: ListView(
        children: [
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
            onTap: () {
              // Navigate to My Orders screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyOrdersScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Shipping addresses'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Shipping Addresses screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ShippingAddressesScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment methods'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Payment Methods screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.confirmation_number),
            title: Text('Promocodes'),
            trailing: Text('You have no applied promocodes'),
            onTap: () {
              // Navigate to Promocodes screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PromocodesScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('My reviews'),
            trailing: Text('Reviews for 4 items'),
            onTap: () {
              // Navigate to My Reviews screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyReviewsScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Settings screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Show logout confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logout and navigate to login screen
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false, // Remove all routes
                          );
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
