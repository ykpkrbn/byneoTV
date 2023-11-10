import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sayfalar/beinsport/bein1.dart';
import '../sayfalar/beinsport/bein2.dart';
import '../sayfalar/beinsport/bein3.dart';
import '../sayfalar/beinsport/bein4.dart';
import '../sayfalar/beinsport/bein5.dart';
import '../util/tab.dart';

class BeinSportsMyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  final List<Widget> myTabs = const [
    MyTab(text: 'Beinsports 1'),
    MyTab(text: 'Beinsports 2'),
    MyTab(text: 'Beinsports 3'),
    MyTab(text: 'Beinsports 4'),
    MyTab(text: 'Beinsports 5'),
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
      children: const [
        Bein1(),
        Bein2(),
        Bein3(),
        Bein4(),
        Bein5(),
      ],
    );
  }
}
