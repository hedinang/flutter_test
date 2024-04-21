import 'package:flutter/material.dart';
import 'package:learn/api/auth.dart';
import 'package:learn/widgets/input.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  static final AuthApi authApi = AuthApi();
  String url = 'assets/images/weathers/rabbit.jpg';
  late String email;
  late String password;

  void _setEmail(newEmail) {
    setState(() => email = newEmail);
  }

  void _setPassword(newPassword) {
    setState(() => password = newPassword);
  }

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";
  }

  Future<void> login(context) async {
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
      if (mounted) {
        Fluttertoast.showToast(
            msg: "Your email or password is wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 20,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 14.0);
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', result.data["token"]);
      Fluttertoast.showToast(
          msg: "Welcome to winitech services",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 20,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 14.0);
      await Navigator.pushNamed(context, '/home');
    }
  }

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 36, 171, 224),
        Color.fromARGB(255, 50, 130, 235),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(60, 30, 60, 10),
              child: Image.asset("assets/images/weathers/winitech.jpg")),
          const Text(
            "Please login to use our services",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Input(
            title: "Email",
            prefixIcon: Icons.email,
            obscure: false,
            suffixIcon: null,
            setData: _setEmail,
          ),
          Input(
            title: "Password",
            prefixIcon: Icons.lock,
            suffixIcon: Icons.remove_red_eye,
            obscure: true,
            setData: _setPassword,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => {login(context)},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 62, 71, 63))),
                child: const Text(
                  "Forget password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
              OutlinedButton(
                onPressed: () => {login(context)},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  style: TextStyle(color: Colors.white), "Not a member?"),
              const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
              GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: "sdsd");
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white),
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
