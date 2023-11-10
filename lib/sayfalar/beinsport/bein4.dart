import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../izletilecek_alan.dart';

class Bein4 extends StatelessWidget {
  const Bein4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('beinsport4').orderBy('kanal_adi',descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        final veri = snapshot.data?.docs;
        if (veri == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (veri.isEmpty) {
          return const Center(
            child: Text('Şuan video yok'),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: veri.length,
          itemBuilder: (context, index) {
            final verii = veri[index];
            print('----' * 25);
            print(verii['kanal']);
            return InkWell(
              onTap: () {
                Get.to(OynatilacakAlan(
                  kanalinAdi: verii['kanal_adi'],
                  kanalLink: verii['kanal'],
                ));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset('assets/sport/beinsport4.png'),
                      Text(verii['kanal_adi'] ?? 'Kanal Adı Alınamadı'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
