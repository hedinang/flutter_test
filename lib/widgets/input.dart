import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String title;
  final IconData prefixIcon;
  final dynamic suffixIcon;
  final bool obscure;
  final void Function(String) setData;

  const Input(
      {super.key,
      required this.title,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.obscure,
      required this.setData});

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure;
  }

  void showOrHidePassword() {
    setState(() {
      obscure = !obscure;
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
            onChanged: widget.setData,
            style: const TextStyle(color: Colors.white),
            obscureText: widget.obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.title,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 46, 41, 41)),
              prefixIcon: Icon(
                widget.prefixIcon,
                color: Colors.white,
              ),
              suffixIcon: GestureDetector(
                  onTap: showOrHidePassword,
                  child: Icon(
                    widget.suffixIcon,
                    color: Colors.white,
                  )),
            ),
          )),
    );
  }
}
