import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBar extends StatelessWidget {
  dynamic color;
  final String? bilgi;

  MySnackBar({Key? key, this.color, this.bilgi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GetSnackBar(
        backgroundColor: color,
        title: bilgi,
        snackPosition: SnackPosition.TOP,
        borderColor: color[900],
      ),
    );
  }
}
