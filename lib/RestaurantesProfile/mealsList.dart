import 'package:delivery_app/Database/fireStoreServices.dart';
import 'package:delivery_app/Models/mealsModel.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../colors.dart';
import '../foodDetail.dart';

class MealsList extends ConsumerWidget {
  const MealsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(wProvider).when(
      data: (value) => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: value.length,
        itemBuilder: (context, index) {
          MealsModel meal = value[index];
          return popularFoodCard(
            context,
            '${meal.img}',
            '${meal.title}',
            '${meal.title}',
            '${meal.star}',
            // '${meal.category}',
            index,
          );
        },
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error.toString()),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.refresh(rProvider),
              child: Text('try again'),
            )
          ],
        ),
      ),
    );
  }

  Widget popularFoodCard(BuildContext context, String imagePath, String title,
      String weight, String star, int index) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, left: 20, top: 20, bottom: 0),
        padding: EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 20, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          PrimaryText(
                            text: 'top of the week',
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: title, size: 22, fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: weight, size: 18, color: AppColors.lightGray),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Icon(Icons.add, size: 20),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 12),
                          SizedBox(width: 5),
                          PrimaryText(
                            text: star,
                            size: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], blurRadius: 20)
                  ]),
              child: Hero(
                tag: imagePath,
                child: Image.network(imagePath,
                    width: MediaQuery.of(context).size.width / 2.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
