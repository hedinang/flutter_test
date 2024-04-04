import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  String title;
  String data;
  IconData iconData;

  Input(
      {super.key,
      required this.title,
      required this.data,
      required this.iconData});

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  late String data;
  late String title;
  late IconData iconData;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    title = widget.title;
    iconData = widget.iconData;
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: TextField(
            onChanged: _setData,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: title,
                prefixIcon: Icon(iconData)),
          ),
        ));
  }
}
