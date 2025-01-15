import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;
    final String userEmail = user?.email ?? "user@example.com";

    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //* Drawer Header
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "W E L C O M E",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userEmail, // Display the user's email
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //* Drawer Items
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  title: const Text("H O M E"),
                  onTap: () {
                    // Navigate to the home screen
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: const Text("P R O F I L E"),
                  onTap: () {
                    // Navigate to the settings screen
                    Navigator.pop(context); // Close the drawer
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.help,
                    color: Colors.grey,
                  ),
                  title: const Text("U S E R S"),
                  onTap: () {
                    // Navigate to the help screen
                    Navigator.pop(context); // Close the drawer
                    Navigator.pushNamed(context, '/users');
                  },
                ),
                const Divider(), // Add a divider
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.grey,
              ),
              title: const Text("L O G O U T"),
              onTap: () {
                // Sign out the user
                FirebaseAuth.instance.signOut();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
