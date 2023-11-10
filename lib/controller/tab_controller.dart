import 'package:byneo/sayfalar/yerli_dizi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sayfalar/canli.dart';
import '../sayfalar/dizi.dart';
import '../sayfalar/porno.dart';
import '../sayfalar/spor.dart';
import '../util/tab.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  final List<Widget> myTabs = const [
    MyTab(text: 'Canlı Maç'),
    MyTab(text: 'Spor'),
    MyTab(text: 'Dizi'),
    MyTab(text: 'Yerli Dizi'),
    MyTab(text: 'Yerli Film'),
    MyTab(text: 'Yabancı Film'),
    MyTab(text: 'Porno'),
  ];

  @override
  void onInit() {
    controller = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  TabBarView tabbarGosterenGovde() {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      viewportFraction: 1,
      children: [
        Canli(),
        Spor(),
        Dizi(),
        YerliDizi(),
        Dizi(),
        Dizi(),
        Porno(),
      ],
    );
  }
}
