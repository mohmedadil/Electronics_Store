import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/favourite_box.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/popular_box.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Favourite',
          style: Styles.textStyle18,
        ),
        leading: const CircleAvatar(
            backgroundColor: Colors.white, child: Icon(Icons.arrow_back)),
        centerTitle: true,
        actions: const [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.heart,
                color: Colors.grey,
              ))
        ],
      ),
      body: Padding(
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
      ),
    );
  }
}
