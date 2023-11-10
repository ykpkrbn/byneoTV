import 'package:byneo/sayfalar/video_oynatici.dart';
import 'package:flutter/material.dart';

class OynatilacakAlan extends StatelessWidget {
  String? kanalinAdi;
  String? kanalLink;
  OynatilacakAlan({Key? key, this.kanalinAdi, this.kanalLink}) : super(key: key);

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
        canliMi: true,
      ),
    );
  }
}
