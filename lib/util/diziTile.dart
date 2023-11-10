import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_tema.dart';

class DiziTile extends StatelessWidget {
  final String diziYolu;
  final String diziAdi;
  final Function()? onTap;

  const DiziTile(
      {Key? key, required this.diziYolu, required this.diziAdi, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTema myTema = MyTema();
    return Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: myTema.acikTema.scaffoldBackgroundColor.isNull ? Colors.blue.shade900 : Colors.black45,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap:  onTap ?? () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Image.asset(diziYolu),
              ),
              Text(diziAdi)
            ],
          ),
        ));
  }
}
