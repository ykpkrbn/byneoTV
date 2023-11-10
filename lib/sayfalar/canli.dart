import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/beinsport_tab_controller.dart';

class Canli extends StatelessWidget {
  const Canli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BeinSportsMyTabController controller = Get.put(BeinSportsMyTabController());
    return  Column(
      children: [
        Expanded(child: controller.tabbarGosterenGovde()),
        TabBar(
          controller: controller.controller,
          tabs: controller.myTabs,
          splashBorderRadius: BorderRadius.circular(11),
          splashFactory: NoSplash.splashFactory,
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          padding: const EdgeInsets.all(7),
          automaticIndicatorColorAdjustment: true,
          labelPadding: EdgeInsets.all(7),
          indicatorPadding: const EdgeInsets.only(bottom: 2),
        ),
      ],
    );
  }
}
