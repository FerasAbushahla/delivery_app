import 'package:delivery_app/Favorites.dart';
import 'package:delivery_app/Profile.dart';
import 'package:delivery_app/cart.dart';
import 'package:delivery_app/colors.dart';
import 'package:delivery_app/Home/home.dart';
import 'package:delivery_app/location.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Wraper extends StatefulWidget {
  @override
  _WraperState createState() => _WraperState();
}

class _WraperState extends State<Wraper> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // int _navigationBarCurrentIndex = 0;

  // List<Widget> _widgetOptions = <Widget>[
  //   Home(),
  //   Location(),
  //   Cart(),
  //   Favorites(),
  //   Profile(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   centerTitle: false,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: SvgPicture.asset('assets/menu.svg'),
      //     onPressed: () => _scaffoldKey.currentState.openDrawer(),
      //   ),
      //   // title: Padding(
      //   //   padding: const EdgeInsets.only(left: 10),
      //   //   child: CircleAvatar(
      //   //     radius: 25,
      //   //     backgroundImage: AssetImage('assets/man.jpeg'),
      //   //   ),
      //   // ),
      //   // actions: [
      //   //   IconButton(
      //   //     onPressed: null,
      //   //     icon: SvgPicture.asset('assets/menu.svg'),
      //   //   ),
      //   //   SizedBox(
      //   //     width: 20,
      //   //   )
      //   // ],
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: AppColors.primary,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: PrimaryText(
      //           text: 'My Orders',
      //           size: 16,
      //           fontWeight: FontWeight.w600,
      //         ),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //           title: PrimaryText(
      //             text: 'Location',
      //             size: 16,
      //             fontWeight: FontWeight.w600,
      //           ),
      //           onTap: () => pushNewScreen(
      //                 context,
      //                 screen: Location(),
      //                 withNavBar: true,
      //               )
      //           // onTap: () {
      //           //   Navigator.push(
      //           //     context,
      //           //     MaterialPageRoute<void>(
      //           //       builder: (BuildContext context) => Location(),
      //           //     ),
      //           //   );
      //           // },
      //           ),
      //       ListTile(
      //         title: PrimaryText(
      //           text: 'Payment Methods',
      //           size: 16,
      //           fontWeight: FontWeight.w600,
      //         ),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: PrimaryText(
      //           text: 'Contact Us',
      //           size: 16,
      //           fontWeight: FontWeight.w600,
      //         ),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: PrimaryText(
      //           text: 'Settings',
      //           size: 16,
      //           fontWeight: FontWeight.w600,
      //         ),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
      body: PresistBottomNavBar(),
      // body: _widgetOptions.elementAt(_navigationBarCurrentIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.location_on), label: 'Location'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_bag), label: 'Cart'),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications), label: 'Profile'),
      //   ],
      //   currentIndex: _navigationBarCurrentIndex,
      //   selectedItemColor: AppColors.primary,
      //   unselectedItemColor: AppColors.lightGray,
      //   onTap: _changeItem,
      // ),
    );
  }

  // void _changeItem(int value) {
  //   print(value);
  //   setState(() {
  //     _navigationBarCurrentIndex = value;
  //   });
  // }
}

class PresistBottomNavBar extends StatefulWidget {
  @override
  _PresistBottomNavBarState createState() => _PresistBottomNavBarState();
}

class _PresistBottomNavBarState extends State<PresistBottomNavBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Location(),
    Cart(),
    Favorites(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _widgetOptions,
      items: [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: 'Home',
            activeColorPrimary: AppColors.primary,
            inactiveColorPrimary: AppColors.lightGray),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.location_on),
            title: 'Location',
            activeColorPrimary: AppColors.primary,
            inactiveColorPrimary: AppColors.lightGray),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.shopping_bag),
            title: 'Cart',
            activeColorPrimary: AppColors.tertiary,
            activeColorSecondary: AppColors.primary,
            inactiveColorPrimary: AppColors.lightGray),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.favorite),
            title: 'Fav',
            activeColorPrimary: AppColors.primary,
            inactiveColorPrimary: AppColors.lightGray),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.person),
            title: 'Profile',
            activeColorPrimary: AppColors.primary,
            inactiveColorPrimary: AppColors.lightGray),
      ],
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style16,
    );
  }
}
