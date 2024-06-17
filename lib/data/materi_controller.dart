import 'dart:convert';

import 'package:sekolahdulu/data/remote/materi.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MateriController extends GetxController {
  RxList<Materi> materiListRx = List<Materi>.empty(growable: true).obs;
  DatabaseReference ref = FirebaseDatabase.instance.ref('/');

  Future fetchAllMateri() async {
    final snaps = await ref.child('materi').get();
    final List<Materi> materiList = List.empty(growable: true);

    if (snaps.exists) {
      for (var element in snaps.children) {
        Map<String, dynamic> dataDecode = json.decode(
          jsonEncode(element.value),
        );

        // String id = element.key.toString();

        Materi materi = Materi(
          judul: dataDecode['judul'],
          deskripsi: dataDecode['deskripsi'],
          urlVideo: dataDecode['url'],
          durasi: dataDecode['durasi'],
        );

        materiList.add(materi);
      }

      materiListRx.value = materiList;
      // log('${materiList}');
      return materiListRx;
    }
  }

  Future fetchSpecificMateri(int index, String title) async {
    final snaps = await ref.child('materi').child('materi0${index+1}').get();

    if (snaps.exists) {
      Map<String, dynamic> dataDecode = json.decode(
        jsonEncode(snaps.value),
      );

      // String id = snaps.key.toString();

      Materi materi = Materi(
        judul: dataDecode['judul'],
        deskripsi: dataDecode['deskripsi'],
        urlVideo: dataDecode['url'],
        durasi: dataDecode['durasi'],
      );

      return materi;
    }
  }
}
