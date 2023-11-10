import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'izletilecek_alan_video.dart';

class YerliDizi extends StatelessWidget {
  const YerliDizi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('porno').orderBy('porno_adi',descending: true)
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
              print(verii['porno']);
              return InkWell(
                onTap: () {
                  Get.to(OynatilacakAlanVideo(
                    kanalinAdi: verii['porno_adi'],
                    kanalLink: verii['porno'],
                  ));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset('assets/sport/beinsport1.png'),
                        Text(verii['porno_adi'] ?? 'Kanal Adı Alınamadı'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
