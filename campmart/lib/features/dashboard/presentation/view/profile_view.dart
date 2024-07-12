import 'package:campmart/features/auth/presentation/view/login_view.dart';
import 'package:campmart/features/dashboard/presentation/view/setting_view.dart';
import 'package:campmart/features/dashboard/presentation/view/setting_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Ram Narayan'),
            subtitle: Text('ramnarayan@gmail.com'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My orders'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to My Orders view
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyOrdersView()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Shipping addresses'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Shipping Addresses view
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ShippingAddressesView()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment methods'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Payment Methods view
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PaymentMethodsView()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.confirmation_number),
            title: const Text('Promocodes'),
            trailing: const Text('You have no applied promocodes'),
            onTap: () {
              // Navigate to Promocodes view
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PromocodesView()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('My reviews'),
            trailing: const Text('Reviews for 4 items'),
            onTap: () {
              // Navigate to My Reviews view
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyReviewsView()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Settings view
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsView()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Show logout confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logout and navigate to login view
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()),
                            (route) => false, // Remove all routes
                          );
                        },
                        child: const Text('Logout'),
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
