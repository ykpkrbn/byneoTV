import 'package:byneo/controller/tab_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'B Y N E O   T V',
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: myTabController.controller,
            tabs: myTabController.myTabs,
            splashBorderRadius: BorderRadius.circular(12),
            splashFactory: NoSplash.splashFactory,
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            indicatorPadding: const EdgeInsets.only(bottom: 3),
          ),
          Expanded(child: myTabController.tabbarGosterenGovde()),
        ],
      ),
    );
  }
}
