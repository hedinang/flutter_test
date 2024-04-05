import 'package:flutter/material.dart';
import 'package:learn/api/auth.dart';
import 'package:learn/model/response_api.dart';
import 'package:learn/widgets/input.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePateState createState() => HomePateState();
}

class HomePateState extends State<HomePage> {
  AuthApi authApi = AuthApi();
  String url = 'assets/images/weathers/rabbit.jpg';
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";
  }

  Future<void> login() async {
    final result = await authApi.login({'email': email, 'password': password});
    if (result.statusCode == 400) {
      //  showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Login Failed'),
      //       content: Text('Unable to log in. Please try again.'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Login failed. Please try again.'),
      //   ),
      // );
      Fluttertoast.showToast(
          msg: "Your email or password is wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 20,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 14.0);
    } else {}
    print("dsdsds");
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
          ),
          OutlinedButton(
            onPressed: login,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ));
  }
}
