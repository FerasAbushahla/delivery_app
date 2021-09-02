import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantesModel {
  String title;
  String logo;

  DocumentReference reference;

  RestaurantesModel({
    this.title,
    this.logo,
  });

  factory RestaurantesModel.fromSnapshot(DocumentSnapshot snapshot) {
    RestaurantesModel newRestaurante =
        RestaurantesModel.fromJson(snapshot.data());
    newRestaurante.reference = snapshot.reference;
    return newRestaurante;
  }

  RestaurantesModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    logo = json['Logo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Title': title,
      'Logo': logo,
    };
  }
}
