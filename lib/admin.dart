import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement user management action
              },
              child: Text('Manage Users'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement content management action
              },
              child: Text('Manage Content'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement settings action
              },
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
