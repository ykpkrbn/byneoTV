import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String? text;
  const MyTab({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 30,
      text: text,
    );
  }
}
