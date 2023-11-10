import 'package:byneo/anasayfa/ana_sayfa.dart';
import 'package:get/get.dart';
import '../anasayfa/deneme.dart';
import '../diziler/dizi_detay.dart';

class MyRoutes {

  static const String _anaSayfa = '/';
  static const String _deneme = '/deneme';
  static const String _diziDetay = '/diziDetay';

  static String getAnaSayfa ()=> _anaSayfa;
  static String getDeneme ()=> _deneme;
  static String getDiziDetay (String aa)=> _diziDetay;

  List<GetPage> rotalar = [
    GetPage(name: _deneme, page: ()=> const Deneme()),
    GetPage(name: _diziDetay, page: ()=> DiziDetay(baslik: '',),),
    GetPage(name: _anaSayfa, page: ()=> const AnaSayfa()),
  ];

}


