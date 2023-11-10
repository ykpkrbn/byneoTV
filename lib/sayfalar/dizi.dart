import 'package:flutter/material.dart';
import '../util/diziTile.dart';
import 'package:get/get.dart';

class Dizi extends StatelessWidget {
  Dizi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1 / 1.5),
      itemCount: diziYayinlar.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = diziYayinlar[index];
        return DiziTile(
          diziYolu: item[0],
          diziAdi: item[1],
          onTap: () => selectedItem(item[2], item[1]),
        );
      },
    );
  }

  List diziYayinlar = [
    [
      'assets/dizi_yayin_adi/exxen.png',
      'EXXEN',
      '/diziDetay',
    ],
    [
      'assets/dizi_yayin_adi/gain.png',
      'Gain',
      '/deneme',
    ],
    [
      'assets/dizi_yayin_adi/bluTV.png',
      'BluTV',
      '/deneme',
    ],
    [
      'assets/dizi_yayin_adi/netflix.png',
      'Netflix',
      '/deneme',
    ],
    [
      'assets/dizi_yayin_adi/disney_plus.png',
      'Disney+',
      '/deneme',
    ],
    [
      'assets/dizi_yayin_adi/amazon_prime.png',
      'Amazon Prime',
      '/deneme',
    ],
  ];

  void selectedItem(String item, String kanalAdi) {
    Get.toNamed(item);
    final snackbar = GetSnackBar(
      titleText: Text(
        'Seçilen Kanal $kanalAdi',
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        '$kanalAdi dizi kanalını başarılı bir şekilde seçtin amk',
        style: const TextStyle(color: Colors.black),
      ),
      borderRadius: 12,
      borderColor: Colors.yellow.shade900,
      reverseAnimationCurve: Curves.elasticInOut,
      backgroundColor: Colors.yellow,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      barBlur: 3,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
    );
    Get.showSnackbar(snackbar);

  }
}
