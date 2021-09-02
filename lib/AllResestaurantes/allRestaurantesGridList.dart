import 'package:delivery_app/Database/fireStoreServices.dart';
import 'package:delivery_app/Models/restaurantesModel.dart';
import 'package:delivery_app/colors.dart';
import 'package:delivery_app/RestaurantesProfile/resturanteProfile.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRestaurantesGridList extends ConsumerWidget {
  const AllRestaurantesGridList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(rProvider).when(
      data: (List<RestaurantesModel> value) => GridView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        //shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: value.length,
        itemBuilder: (context, index) {
          RestaurantesModel restaurant = value[index];
          return resturantsCard(
              context, '${restaurant.logo}', '${restaurant.title}', index);
        },
      ),
      loading: () =>
          //Text('loading...')
          Center(
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
                child: Text('try again'))
          ],
        ),
      ),
    );
  }

  Widget resturantsCard(
      BuildContext context, String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResturantesProfile(imagePath)))
        // setState(
        //   () => {
        //     print(index),
        //     selectedResturantCard = index,
        //   },
        // ),
      },
      child: Container(
        margin: EdgeInsets.only(right: 15, top: 20, bottom: 0),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            //  selectedResturantCard == index
            //     ? AppColors.primary
            //     : AppColors.white,
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
                child: Image.network(imagePath,
                    width: MediaQuery.of(context).size.width / 5.8),
              ),
            ),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: AppColors.tertiary,
                // selectedResturantCard == index
                //     ? AppColors.white
                //     : AppColors.tertiary,
                shape: CircleBorder(),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppColors.white,
                  // selectedResturantCard == index
                  //     ? AppColors.black
                  //     : AppColors.white,
                ))
          ],
        ),
      ),
    );
  }
}
