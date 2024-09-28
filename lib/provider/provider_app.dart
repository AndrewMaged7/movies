import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderApp extends ChangeNotifier {
  int selectedIndex = 0;
  upLoadImageToFireStorage() {}
  getImageFromFireStorage() {}

  CollectionReference details =
      FirebaseFirestore.instance.collection('details');
  upLoadDataToDataBase(
      {required String title,
      required String des,
      required num id,
      required String date,
      }
      ) async {
    return details
        .add({'title': title, 'date': date, 'des': des,"id" : id})
        .then((value) => print("Details Added"))
        .catchError((error) => print("Failed to add Details: $error"));
  }

  getDataFromDataBase() async {
    await FirebaseFirestore.instance
        .collection('details')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["title"]);
      });
    });
  }
}
