import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/features/home/presentation/controler/provider/model.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/menu.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  // UserCredential? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: const BottomBar(),
          extendBody: true,
          backgroundColor: kBackgroundColor,
          drawer: const MyDrawer(),
          body: Selector<Mystate, int>(
            selector: (context, value) => value.number,
            builder: (context, value, child) => page[value],
          )),
    );
  }
}
