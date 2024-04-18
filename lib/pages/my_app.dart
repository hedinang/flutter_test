import 'package:flutter/material.dart';
import 'package:learn/pages/conversationList/conversation_list.dart';
import 'package:learn/pages/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => ConversationList()
      },
      // home: LoginPage(),
    );
  }
}
