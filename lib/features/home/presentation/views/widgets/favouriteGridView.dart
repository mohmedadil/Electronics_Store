import 'package:flutter/material.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/favourite_box.dart';

class FavouriteGridView extends StatelessWidget {
  const FavouriteGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 2.9 / 3.8),
          children: const [
            FavouriteBox(),
            FavouriteBox(),
            FavouriteBox(),
            FavouriteBox()
          ]),
    );
  }
}
