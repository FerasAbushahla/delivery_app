import 'package:delivery_app/Database/fireStoreServices.dart';
import 'package:delivery_app/Models/restaurantesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantsList extends ConsumerWidget {
  const RestaurantsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(rProvider).when(
      data: (value) => ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          RestaurantesModel resturant = value[index];
          return Column(
            children: [Text('${resturant.title}')],
          );
        },
      ),
      loading: () => Text('loading...'),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              error.toString(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.refresh(rProvider),
              child: Text('try again'),
            ),
          ],
        ),
      ),
    );
  }
}
