import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String _userName = 'User123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Stack(
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/03.jpg"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _userName,
              style: const TextStyle(
                letterSpacing: 1.2,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'First Name', value: 'User'),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'Last Name', value: '123'),
            const SizedBox(height: 15),
            _buildProfileInfo(
                title: 'Email', value: 'user123@gmail.com'),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'Phone', value: '0771234567'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(195, 51, 154, 163),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
