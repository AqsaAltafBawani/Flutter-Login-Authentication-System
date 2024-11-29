import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  HomePage({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC), // Light peachy pink background
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color(0xFF009688), // Turquoise
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Greeting Icon
              const Icon(
                Icons.home_rounded,
                size: 100,
                color: Color(0xFF009688), // Turquoise
              ),
              const SizedBox(height: 24),

              // Greeting Text
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF37474F), // Dark grey
                ),
              ),
              const SizedBox(height: 16),

              // User Email Display
              Text(
                user?.email ?? "Guest User",
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF607D8B), // Grey-blue
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),

              // Logout Button
              ElevatedButton(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688), // Turquoise
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
