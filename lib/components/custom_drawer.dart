// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return //* Add a Drawer
        Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //* Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
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
                SizedBox(height: 10),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "user@example.com", // Replace with the user's email if available
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          //* Drawer Items
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              // Navigate to the home screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Navigate to the settings screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help"),
            onTap: () {
              // Navigate to the help screen
              Navigator.pop(context); // Close the drawer
            },
          ),
          Divider(), // Add a divider
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Sign out the user
              FirebaseAuth.instance.signOut();
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
