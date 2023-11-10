import 'package:flutter/material.dart';

class Deneme extends StatelessWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            onPressed: () {
              print("TextButton");
            },
            child: Text("TextButton")),
      ),
    );
  }
}
