import 'package:delivery_app/Providers/authProvider.dart';
import 'package:delivery_app/login.dart';
import 'package:delivery_app/wraper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

class SplashScreen extends StatelessWidget {
  // navigationToHome(context) async {
  //   await Future.delayed(
  //     Duration(seconds: 3),
  //   );
  //   // Navigator.pushReplacement(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) {
  //   //       return login();
  //   //     },
  //   //   ),
  //   // );
  // }
  @override
  Widget build(BuildContext context) {
    //navigationToHome(context);
    // navigationToHome(context) async {
    //   await Future.delayed(
    //     Duration(seconds: 3),
    //   );
    // }
    return AuthChecker();
    // return Scaffold(
    //   body: Center(
    //     child: Image.asset(
    //       'assets/sandwhich.png',
    //       width: 150,
    //     ),
    //   ),
    // );
  }
}

class AuthChecker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    return _authState.when(data: (value) {
      if (value != null) {
        return Wraper();
      } else {
        return Login();
      }
    }, loading: () {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }, error: (_, __) {
      print('Errorrrrrrrrrr');
    });
  }
}
