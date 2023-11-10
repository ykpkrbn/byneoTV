import 'package:byneo/sayfalar/video_oynatici.dart';
import 'package:flutter/material.dart';

class OynatilacakAlanVideo extends StatelessWidget {
  String? kanalinAdi;
  String? kanalLink;
  OynatilacakAlanVideo({Key? key, this.kanalinAdi, this.kanalLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kanalinAdi!),
      ),
      body: VideoOynatici(
        // FulEkranOlsunMu: true,
        linki: kanalLink!,
        otomatikOynatilsinMi: true,
        canliMi: false,
      ),
    );
  }
}
