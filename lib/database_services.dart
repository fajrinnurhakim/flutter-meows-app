import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  static Future<void> CreateUpdatemeows(
      BuildContext context, String Deskripsi, String NamaKucing, String NomorWa, ) async {
    DocumentReference meowsReference =
        FirebaseFirestore.instance.collection("meows").doc(NomorWa);
    Map<String, dynamic> datameows = {"NomorWa": NomorWa,"Deskripsi": Deskripsi, "NamaKucing": NamaKucing};
    meowsReference.set(datameows).whenComplete(() {
      Navigator.pop(context);
    });
  }

  static Future<void> deletemeows(String Deskripsi) async {
    CollectionReference meowsCollection =
        FirebaseFirestore.instance.collection('meows');
    return await meowsCollection.doc(Deskripsi).delete();
  }
}
