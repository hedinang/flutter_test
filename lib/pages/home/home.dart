import 'package:flutter/material.dart';
import 'package:learn/widgets/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePateState createState() => HomePateState();
}

class HomePateState extends State<HomePage> {
  String url = 'assets/images/weathers/rabbit.jpg';
  late String email = "";
  late String password;

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 50, 130, 235),
        Color.fromARGB(255, 36, 171, 224)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(60, 30, 60, 10),
              child: Image.asset("assets/images/weathers/korea-map.jpg")),
          Input(
            title: "Email",
            data: email,
            iconData: Icons.email,
            obscure: false,
          ),
          Input(
            title: "Password",
            data: password,
            iconData: Icons.lock,
            obscure: true,
          )
        ],
      ),
    ));
  }
}
