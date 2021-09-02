import 'package:delivery_app/Providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile'),
              ElevatedButton(
                onPressed: () => _auth.logout(),
                child: Text('SignOut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
