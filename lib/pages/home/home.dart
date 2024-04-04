import 'package:flutter/material.dart';
import 'package:learn/pages/home/widgets/home_weather_icon.dart';
import 'package:learn/widgets/input.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//               Color(0xffde4848),
//               Color.fromARGB(255, 240, 227, 47)
//             ])),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [HomeWeatherIcon(), HomeWeatherIcon()],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePateState createState() => HomePateState();
}

class HomePateState extends State<HomePage> {
  String url = 'assets/images/weathers/rabbit.jpg';
  late String email = "";

  @override
  void initState() {
    super.initState();
    email = "";
  }

  late String password;

  void _setUrl() {
    setState(() {
      if (url == 'assets/images/weathers/rabbit.jpg') {
        url = "assets/images/weathers/cat.jpg";
      } else {
        url = "assets/images/weathers/rabbit.jpg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeWeatherIcon(
            url: url,
          ),
          TextButton(
            onPressed: _setUrl,
            child: const Text("hello"),
          ),
          Input(title: "Email", data: email, iconData: Icons.email,)
        ],
      ),
    );
  }
}
