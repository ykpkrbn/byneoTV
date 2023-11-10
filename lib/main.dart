import 'package:byneo/routes/routes.dart';
import 'package:byneo/util/my_tema.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Byneo TV',
      theme: MyTema().acikTema,
      darkTheme: MyTema().koyuTema,
      getPages: MyRoutes().rotalar,
      initialRoute: MyRoutes.getAnaSayfa(),
    );
  }
}
