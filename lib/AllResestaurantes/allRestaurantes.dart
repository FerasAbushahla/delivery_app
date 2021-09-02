import 'package:delivery_app/AllResestaurantes/allRestaurantesGridList.dart';
import 'package:delivery_app/RestaurantesProfile/resturanteProfile.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class AllRestaurantes extends StatefulWidget {
  @override
  _AllRestaurantesState createState() => _AllRestaurantesState();
}

class _AllRestaurantesState extends State<AllRestaurantes> {
  int selectedResturantCard = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: customAppBar(context),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: PrimaryText(
                    text: 'All Restaurants',
                    fontWeight: FontWeight.w700,
                    size: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  height: 525,
                  child: AllRestaurantesGridList(),
                  // child: GridView.builder(
                  //   //shrinkWrap: true,
                  //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //       maxCrossAxisExtent: 200,
                  //       childAspectRatio: 1,
                  //       crossAxisSpacing: 10,
                  //       mainAxisSpacing: 10),
                  //   itemCount: resturantsList.length,
                  //   itemBuilder: (context, index) => Container(
                  //     alignment: Alignment.center,
                  //     //padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                  //     child: resturantsCard(resturantsList[index]['imagePath'],
                  //         resturantsList[index]['name'], index),
                  //   ),
                  // ),
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey[400])),
              child: Icon(Icons.chevron_left),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: AppColors.primary,
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: Icon(Icons.favorite, color: AppColors.white),
          // ),
        ],
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
        margin: EdgeInsets.only(right: 15, top: 20, bottom: 0),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
