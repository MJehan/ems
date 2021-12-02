import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  final firebase = FirebaseFirestore.instance;
  getDataOnTimeLineView() async{
    List itemList = [];
    var querySnapshot = await firebase.collection('/test/').get();
    //print(querySnapshot.size);
    for (var element in querySnapshot.docs) {
      itemList.add(element.data);
      print('data is : $itemList');
    }
    return itemList;
  }
}

// class DatabaseManager {
//   final firebase = FirebaseFirestore.instance;
//   getDataOnTimeLineView() async{
//     List itemList = [];
//     //final List<DatabaseManager> loadedResult = [];
//     var querySnapshot = await firebase.collection('/test/').get();
//     //print(querySnapshot.size);
//     for (var element in querySnapshot.docs) {
//       itemList.add(element.data);
//       print('data is : $itemList');
//     }
//     return itemList;
//   }
// }