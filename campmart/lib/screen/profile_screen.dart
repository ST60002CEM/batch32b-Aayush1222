import 'package:campmart/screen/setting_screen.dart';
import 'package:flutter/material.dart';
// import 'package:your_app_name/screen/my_orders_screen.dart'; // Import the MyOrdersScreen
// import 'package:your_app_name/screen/shipping_addresses_screen.dart'; // Import the ShippingAddressesScreen
// import 'package:your_app_name/screen/payment_methods_screen.dart'; // Import the PaymentMethodsScreen
// import 'package:your_app_name/screen/promocodes_screen.dart'; // Import the PromocodesScreen
// import 'package:your_app_name/screen/my_reviews_screen.dart'; // Import the MyReviewsScreen
// import 'package:your_app_name/screen/settings_screen.dart'; // Import the SettingsScreen

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
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => PromocodesScreen()),
              //   );
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('My reviews'),
            trailing: Text('Reviews for 4 items'),
            onTap: () {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
