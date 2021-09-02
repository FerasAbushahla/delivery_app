import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/Models/mealsModel.dart';
import 'package:delivery_app/Models/restaurantesModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FireStoreService {
  static FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  // Stream<List<RestaurantesModel>> getRestaurantesList() {
  //   return firestoreDB.collection('Restaurantes').snapshots().map((snapshot) =>
  //       snapshot.docs
  //           .map((docs) => RestaurantesModel.fromJson(docs.data()))
  //           .toList());
  // }
}

final rProvider =
    FutureProvider.autoDispose<List<RestaurantesModel>>((ref) async {
  final query =
      await FireStoreService.firestoreDB.collection('Restaurantes').get();

  final list =
      query.docs.map((e) => RestaurantesModel.fromJson(e.data())).toList();
  print('rProvider');
  print(list.length.toString());
  return list;
});

final wProvider = FutureProvider.autoDispose<List<MealsModel>>((ref) async {
  final query = await FireStoreService.firestoreDB
      .collection('Restaurantes')
      .doc('Eb9FF3af78e0iPofmqJz')
      .collection('Wajbat')
      .get();

  // await FireStoreService.firestoreDB.collectionGroup('Wajbat').where('Tiltle' == '');

  final list = query.docs.map((e) => MealsModel.fromJson(e.data())).toList();
  print('wProvider');
  print(list.length.toString());
  return list;
});
