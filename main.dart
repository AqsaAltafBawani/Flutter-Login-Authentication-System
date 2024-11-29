import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import '_login_screen.dart';
import '_home_page.dart';
import '_signup_screen.dart';
import 'ForgetPasswordScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBsoki2KwQQ37-P2Z6Bu_YweEJN3rpb6S8",
        appId: "1:759907693045:web:fc823bd0036c1cb30870bc",
        messagingSenderId: "759907693045",
        projectId: "forget-password-screen-ad3de",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Authentication System',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 55, 104, 0),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(221, 195, 4, 4),
            fontSize: 16,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => HomePage(),
        '/forget-password': (context) => const ForgetPasswordScreen(),
      },
    );
  }
}
