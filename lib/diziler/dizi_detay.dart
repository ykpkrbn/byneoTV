import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiziDetay extends StatelessWidget {
  String? baslik;

  DiziDetay({Key? key, this.baslik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Çekelim mi Veri'),
        ),
        body: Container(
          height: 400,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('exxen').doc().collection('sezon2')
                .orderBy('sezon', descending: true)
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
                  print(verii['sezon']);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(verii['sezon']),
                          const Divider(),
                          Text(verii['sezon']),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
