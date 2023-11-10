import 'package:flutter/material.dart';

class MyTema {
  ///Açık Tema
  ThemeData acikTema = ThemeData(
    scaffoldBackgroundColor: Colors.blue.shade200,
    hoverColor: Colors.transparent,

    useMaterial3: true,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue.shade900,
      titleTextStyle: TextStyle(
        color: Colors.blue.shade900,
        letterSpacing: 5,
        fontWeight: FontWeight.bold,
        fontSize: 26,
        inherit: false,
      ),
      iconTheme: IconThemeData(
        color: Colors.blue.shade900,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicator: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle),
    ),
  );

  /// Koyu Tema
  ThemeData koyuTema = ThemeData.dark(useMaterial3: true).copyWith(
    hoverColor: Colors.transparent,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 55,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.yellow,
        iconTheme: IconThemeData(
          color: Colors.yellow,
        )),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.yellow.shade500,
      unselectedLabelColor: Colors.yellow.shade100,
      indicator: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle),
    ),
  );
}
