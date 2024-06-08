import 'package:flutter/material.dart';
import 'package:assesment2/views/widgets/home_navbar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Mockup',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ProfileScreen(),
    );
  }
}

class User {
  final String username;
  final String profileImageUrl;

  User({required this.username, required this.profileImageUrl});
}

class UserService {
  User getCurrentUser() {
    // Simulate fetching user data from a backend or local storage
    return User(
      username: 'Kevin Anggara',
      profileImageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    User currentUser = userService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(currentUser.profileImageUrl),
            ),
            SizedBox(height: 8),
            Text(
              currentUser.username,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.purple),
              title: Text('Log out'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple),
              onTap: () {
                // Handle log out action
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/profle.jpg', // Path to the logo
                    height: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
