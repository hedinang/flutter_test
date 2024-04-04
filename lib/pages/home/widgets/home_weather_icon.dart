import 'package:flutter/material.dart';

class HomeWeatherIcon extends StatelessWidget {
  final String url;

  const HomeWeatherIcon({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 2,
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        url,
        fit: BoxFit.cover,
        width: 10,
      ),
    );
  }
}
