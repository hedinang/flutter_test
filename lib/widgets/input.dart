import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  String title;
  String data;
  IconData iconData;
  bool obscure;

  Input(
      {super.key,
      required this.title,
      required this.data,
      required this.iconData,
      required this.obscure});

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  late String data;
  late String title;
  late IconData iconData;
  late bool obscure = false;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    title = widget.title;
    iconData = widget.iconData;
    obscure = widget.obscure;
  }

  void _setData(value) {
    setState(() {
      data = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 23, 114, 167)),
          child: TextField(
            onChanged: _setData,
            style: const TextStyle(color: Colors.white),
            obscureText: obscure,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 46, 41, 41)),
                prefixIcon: Icon(
                  iconData,
                  color: Colors.white,
                )),
          )),
    );
  }
}
