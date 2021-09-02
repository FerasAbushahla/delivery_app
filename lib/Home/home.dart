import 'dart:ui';

import 'package:delivery_app/Home/cutomRestaurantesList.dart';
import 'package:delivery_app/AllResestaurantes/allRestaurantes.dart';
import 'package:delivery_app/RestaurantesProfile/resturanteProfile.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import '../constant.dart';
import '../foodDetail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedFoodCard = 0;
  int selectedResturantCard = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: PrimaryText(
                      text: 'Food',
                      size: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: PrimaryText(
                      text: 'Delivery',
                      height: 1.1,
                      size: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.search,
                        color: AppColors.secondary,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.lighterGray)),
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                              color: AppColors.lightGray,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: PrimaryText(
                        text: 'Categories',
                        fontWeight: FontWeight.w700,
                        size: 22),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      itemCount: foodCategoryList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                        child: foodCategoryCard(
                            foodCategoryList[index]['imagePath'],
                            foodCategoryList[index]['name'],
                            index),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: PrimaryText(
                            text: 'Restaurants',
                            fontWeight: FontWeight.w700,
                            size: 22),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 170),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllRestaurantes()));
                          },
                          icon: Icon(Icons.arrow_forward),
                          label: Text('All'),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary,
                            textStyle: TextStyle(color: AppColors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 240,
                    child: CustomRestaurantsList(),
                    // ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: resturantsList.length,
                    //   itemBuilder: (context, index) => Padding(
                    //     padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                    //     child: resturantsCard(
                    //         resturantsList[index]['imagePath'],
                    //         resturantsList[index]['name'],
                    //         index),
                    //   ),
                    // ),
                  ),
                  // SizedBox(
                  //   height: 240,
                  //   child: StreamBuilder<QuerySnapshot>(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('Restuarantes')
                  //         .snapshots(),
                  //     builder: (context, snapshot) {
                  //       if (!snapshot.hasData) {
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       }
                  //       return ListView.builder(
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: resturantsList.length,
                  //         itemBuilder: (context, index) => Padding(
                  //           padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                  //           child: resturantsCard(
                  //               resturantsList[index]['imagePath'],
                  //               resturantsList[index]['name'],
                  //               index),
                  //         ),
                  //       );
                  //       // return ListView(
                  //       //   children: snapshot.data.docs.map((doc) {
                  //       //     return Card(
                  //       //       child: ListTile(
                  //       //         title: Text(doc['Title']),
                  //       //         subtitle: Text(doc['Logo']),
                  //       //       ),
                  //       //     );
                  //       //   }).toList(),
                  //       // );
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: PrimaryText(
                        text: 'Popular', fontWeight: FontWeight.w700, size: 22),
                  ),
                  Column(
                    children: List.generate(
                      popularFoodList.length,
                      (index) => popularFoodCard(
                        popularFoodList[index]['imagePath'],
                        popularFoodList[index]['name'],
                        popularFoodList[index]['weight'],
                        popularFoodList[index]['star'],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget popularFoodCard(
      String imagePath, String name, String weight, String star) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, left: 20, top: 25),
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
                  padding: EdgeInsets.only(top: 25, left: 20),
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
                            text: name, size: 22, fontWeight: FontWeight.w700),
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
                child: Image.asset(imagePath,
                    width: MediaQuery.of(context).size.width / 2.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            print(index),
            selectedFoodCard = index,
          },
        ),
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              selectedFoodCard == index ? AppColors.primary : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.lighterGray,
              blurRadius: 15,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: selectedFoodCard == index
                    ? AppColors.white
                    : AppColors.tertiary,
                shape: CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedFoodCard == index
                        ? AppColors.black
                        : AppColors.white))
          ],
        ),
      ),
    );
  }

  Widget resturantsCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            print(index),
            selectedResturantCard = index,
          },
        ),
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResturantesProfile(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedResturantCard == index
                ? AppColors.primary
                : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // boxShadow: [BoxShadow(color: Colors.grey[400], blurRadius: 20)],
              ),
              child: Hero(
                tag: imagePath,
                child: Image.asset(imagePath,
                    width: MediaQuery.of(context).size.width / 5.8),
              ),
            ),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: selectedResturantCard == index
                    ? AppColors.white
                    : AppColors.tertiary,
                shape: CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedResturantCard == index
                        ? AppColors.black
                        : AppColors.white))
          ],
        ),
      ),
    );
  }
}
