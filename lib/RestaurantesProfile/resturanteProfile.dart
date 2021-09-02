import 'dart:ui';

import 'package:delivery_app/Database/fireStoreServices.dart';
import 'package:delivery_app/RestaurantesProfile/mealsList.dart';
import 'package:delivery_app/colors.dart';
import 'package:delivery_app/constant.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../foodDetail.dart';
import '../constant.dart';

// final productsListProvider = StateProvider<List<String>>((ref) {
//   return [];
// });
//class ResturantesProfile extends ConsumerWidget
class ResturantesProfile extends StatelessWidget {
  final String name;
  ResturantesProfile(this.name);

  @override
  // Widget build(BuildContext context, ScopedReader watch)
  Widget build(BuildContext context) {
    //final Provider = watch(productsListProvider).state;
    // context.read(productsListProvider).state =
    //     context.read(productsListProvider).state..add(value);
    print(popularFoodList.length);
    print(menuCategoryList.length);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                delegate: MySliverAppBar(
                  expandedHeight: 150,
                ),
                pinned: true,
              ),
            ];
          },
          body: ListView(
            children: [
              SizedBox(height: 55),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: PrimaryText(
                        text: 'Popular', fontWeight: FontWeight.w700, size: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: ElevatedButton.icon(
                      onPressed: () {},
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
                height: 248,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.only(bottom: 35),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularFoodList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 5 : 10,
                    ),
                    child: popularFoodCard(
                      context,
                      popularFoodList[index]['imagePath'],
                      popularFoodList[index]['name'],
                      popularFoodList[index]['weight'],
                      popularFoodList[index]['star'],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  //padding: EdgeInsets.only(bottom: 35),
                  scrollDirection: Axis.horizontal,
                  itemCount: menuCategoryList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 5 : 10,
                    ),
                    child: mychip(
                      menuCategoryList[index]['category'],
                    ),
                  ),
                ),
              ),

              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       chipRow('All', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //       chipRow('Meals', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //       chipRow('Sandwiches', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //       chipRow('Salads', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //       chipRow('Sauses', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //       chipRow('Drinks', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //       chipRow('Deserts', AppColors.primary,
              //           onClickAction: () => {debugPrint("CLICKED")}),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 500,
                child: MealsList(),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 20),
              //   child: Column(
              //     children: List.generate(
              //       popularFoodList.length,
              //       (index) => popularFoodCard(
              //         context,
              //         popularFoodList[index]['imagePath'],
              //         popularFoodList[index]['name'],
              //         popularFoodList[index]['weight'],
              //         popularFoodList[index]['star'],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget mychip(String label) {
    return GestureDetector(
      onTap: () => {
        debugPrint("CLICKED"),
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Chip(
          labelPadding: EdgeInsets.all(5),
          backgroundColor: AppColors.primary,
          shadowColor: AppColors.lighterGray,
          padding: EdgeInsets.symmetric(horizontal: 15),
          elevation: 6,
          label: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget chipRow(String label, Color color,
      {Function onClickAction, EdgeInsetsGeometry padding}) {
    return Container(
      margin: EdgeInsets.all(6),
      child: ActionChip(
        labelPadding: EdgeInsets.all(5),
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.lighterGray,
        padding: EdgeInsets.symmetric(horizontal: 10),
        elevation: 6,
        label: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        onPressed: () {
          onClickAction();
        },
      ),
    );
  }

  Widget popularFoodCard(BuildContext context, String imagePath, String name,
      String weight, String star) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetail(imagePath)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, left: 0, top: 20, bottom: 0),
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
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  final String imagePath;

  MySliverAppBar({@required this.expandedHeight, this.imagePath});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var searchBarOffset = expandedHeight - shrinkOffset - 50;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        Container(
          child: Image.asset(
            'assets/ResturantsBackground.jpg',
            fit: BoxFit.cover,
          ),
        ),
        (shrinkOffset < expandedHeight - 20)
            ? Positioned(
                top: searchBarOffset,
                left: MediaQuery.of(context).size.width / 2.75,
                // child: Hero(
                //   tag: imagePath,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(100),
                //       border: Border.all(color: AppColors.white, width: 5),
                //     ),
                //     height: 100,
                //     child: Image.asset(imagePath, fit: BoxFit.cover),
                //   ),
                // ),
                child: Container(
                  //elevation: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.white, width: 5),
                  ),
                  height: 100,
                  child:
                      Image.asset('assets/kfc-logo-1.png', fit: BoxFit.cover),
                  // child: SizedBox(
                  //   height: 40,
                  //   width: MediaQuery.of(context).size.width / 2,
                  //   child: Center(
                  //     child: Text('Dataaaa'),
                  //   ),
                  // ),
                ),
              )
            : SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 4,
                      vertical: (kToolbarHeight - 40) / 4),
                  child: Container(
                    // elevation: 10,
                    child: Center(
                      child: Image.asset('assets/kfc-logo-1.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

  // return Scaffold(
  //   body: ListView(
  //     children: [
  //       Stack(
  //         children: <Widget>[
  //           Column(
  //             children: [
  //               Container(
  //                 height: MediaQuery.of(context).size.height * 0.25,
  //                 width: 400,
  //                 margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage(
  //                         'assets/ResturantsBackground.jpg',
  //                       ),
  //                       fit: BoxFit.fitWidth),
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   boxShadow: [
  //                     BoxShadow(color: AppColors.lightGray, blurRadius: 15)
  //                   ],
  //                 ),
  //                 // child: Image.asset(
  //                 //   'assets/ResturantsBackground.jpg',
  //                 //   width: MediaQuery.of(context).size.width * 0.95,
  //                 //   height: 250,
  //                 // ),
  //               ),
  //             ],
  //           ),
  //           Container(
  //             transform: Matrix4.translationValues(
  //                 MediaQuery.of(context).size.width * 0.38, 130.0, 0.0),
  //             child: Hero(
  //               tag: imagePath,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(100),
  //                   border: Border.all(color: AppColors.white, width: 5),
  //                 ),
  //                 height: 100,
  //                 child: Image.asset(imagePath, fit: BoxFit.cover),
  //               ),
  //             ),
  //           ),
  //           MyCustomAppBar(),
  //         ],
  //       ),

  //       // Padding(
  //       //   padding: EdgeInsets.only(top: 25),
  //       //   child: Column(
  //       //     children: <Widget>[
  //       //       Image.asset(
  //       //         'assets/ResturantsBackground.jpg',
  //       //         width: MediaQuery.of(context).size.width * 0.90,
  //       //       ),
  //       //     ],
  //       //   ),
  //       // )
  //     ],
  //   ),
  // );

  // return NestedScrollView(
  //   headerSliverBuilder: (context, innerBoxIsScrolled) {
  //     return [
  //       SliverAppBar(
  //         backgroundColor: AppColors.white,
  //         backwardsCompatibility: false,
  //         expandedHeight: 235,
  //         elevation: 0,
  //         floating: false,
  //         pinned: true,
  //         flexibleSpace: FlexibleSpaceBar(
  //           centerTitle: true,
  //           background: ListView(
  //             children: [
  //               Stack(
  //                 children: <Widget>[
  //                   Column(
  //                     children: [
  //                       Container(
  //                         height: MediaQuery.of(context).size.height * 0.25,
  //                         width: 400,
  //                         margin: EdgeInsets.symmetric(
  //                             vertical: 0, horizontal: 10),
  //                         decoration: BoxDecoration(
  //                           image: DecorationImage(
  //                               image: AssetImage(
  //                                 'assets/ResturantsBackground.jpg',
  //                               ),
  //                               fit: BoxFit.fitWidth),
  //                           borderRadius: BorderRadius.circular(15.0),
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: AppColors.lightGray, blurRadius: 15)
  //                           ],
  //                         ),
  //                         // child: Image.asset(
  //                         //   'assets/ResturantsBackground.jpg',
  //                         //   width: MediaQuery.of(context).size.width * 0.95,
  //                         //   height: 250,
  //                         // ),
  //                       ),
  //                     ],
  //                   ),
  //                   Container(
  //                     transform: Matrix4.translationValues(
  //                         MediaQuery.of(context).size.width * 0.38,
  //                         130.0,
  //                         0.0),
  //                     child: Hero(
  //                       tag: imagePath,
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(100),
  //                           border:
  //                               Border.all(color: AppColors.white, width: 5),
  //                         ),
  //                         height: 100,
  //                         child: Image.asset(imagePath, fit: BoxFit.cover),
  //                       ),
  //                     ),
  //                   ),
  //                   MyCustomAppBar(),
  //                 ],
  //               ),

  //               // Padding(
  //               //   padding: EdgeInsets.only(top: 25),
  //               //   child: Column(
  //               //     children: <Widget>[
  //               //       Image.asset(
  //               //         'assets/ResturantsBackground.jpg',
  //               //         width: MediaQuery.of(context).size.width * 0.90,
  //               //       ),
  //               //     ],
  //               //   ),
  //               // )
  //             ],
  //           ),
  //         ),
  //       ),
  //       // SliverToBoxAdapter(
  //       //   child: Container(
  //       //     child: Text(
  //       //       'Description',
  //       //       style: TextStyle(color: AppColors.primary),
  //       //     ),
  //       //   ),
  //       // ),
  //     ];
  //   },
  //   body: Container(
  //     color: AppColors.white,
  //     child: Text('Bodyyyyyyy'),
  //   ),
  // );

  // return NestedScrollView(
  //   headerSliverBuilder: (context, innerBoxIsScrolled) {
  //     return [
  //       SliverAppBar(
  //           expandedHeight: 200,
  //           elevation: 0,
  //           floating: false,
  //           pinned: true,
  //           leading: Container(),
  //           flexibleSpace: FlexibleSpaceBar(
  //             centerTitle: true,
  //             background: Image.asset(
  //               'assets/ResturantsBackground.jpg',
  //             ),
  //           )),
  //       SliverToBoxAdapter(
  //         child: Container(),
  //       ),
  //     ];
  //   },
  //   body: Container(
  //     color: AppColors.white,
  //   ),
  // );

  ///////////
  ///
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: <Widget>[
//             SliverPersistentHeader(
//               pinned: true,
//               floating: true,
//               delegate: CustomSliverDelegate(
//                 expandedHeight: 200,
//               ),
//             ),
//             SliverFillRemaining(
//               child: Center(
//                 child: Text("data"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;

//   CustomSliverDelegate({
//     @required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 2 - shrinkOffset;
//     final proportion = 2 - (expandedHeight / appBarSize);
//     final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
//     return SizedBox(
//       height: expandedHeight + expandedHeight / 3,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//             child: AppBar(
//               backgroundColor: AppColors.primary,
//               leading: Container(),
//               elevation: 0.0,
//               title: Opacity(
//                 opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//                 child: SizedBox(
//                   child: Image.asset('assets/kfc-logo-1.png'),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0.0,
//             right: 0.0,
//             top: cardTopPosition > 0 ? cardTopPosition : 0,
//             bottom: 0.0,
//             child: Opacity(
//               opacity: percent,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 160 * percent, vertical: 28 * percent),
//                 child: Container(
//                   // decoration: BoxDecoration(
//                   //   borderRadius: BorderRadius.circular(100),
//                   //   border: Border.all(color: AppColors.white, width: 5),
//                   // ),
//                   //height: 10,
//                   child: Image.asset(
//                     'assets/kfc-logo-1.png',
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }

