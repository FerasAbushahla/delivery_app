import 'package:cloud_firestore/cloud_firestore.dart';

class MealsModel {
  String title;
  String category;
  String img;
  String star;

  DocumentReference reference;

  MealsModel({
    this.title,
    this.category,
    this.img,
    this.star,
  });

  factory MealsModel.fromSnapshot(DocumentSnapshot snapshot) {
    MealsModel newMeal = MealsModel.fromJson(snapshot.data());
    newMeal.reference = snapshot.reference;
    return newMeal;
  }

  MealsModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    category = json['Category'];
    img = json['Img'];
    star = json['Star'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Title': title,
      'Category': category,
      'Img': img,
      'Star': star,
    };
  }
}
