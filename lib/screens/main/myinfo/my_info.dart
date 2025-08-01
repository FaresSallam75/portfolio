import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xFF242430),
        child: Column(
          children: [
            Spacer(flex: 2),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/IMG_9753.JPG"),
            ),
            Spacer(),
            Text("Fares Sallam", style: Theme.of(context).textTheme.titleSmall),
            Text(
              "Mobile Flutter Developer",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
