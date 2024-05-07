import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/menu.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });
  //final UserCredential user;

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
