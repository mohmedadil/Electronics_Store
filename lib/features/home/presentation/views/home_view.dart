import 'package:flutter/material.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/category_section.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/newarrival_section.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/popular_box.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/popular_section.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/search_section.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // UserCredential? user;

  @override
  Widget build(BuildContext context) {
    // user = GoRouterState.of(context).extra! as UserCredential;

    return const Scaffold(
      bottomNavigationBar: const BottomBar(),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 CustomAppbar(),
                 SearchSection(),
                 SizedBox(
                  height: 26,
                ),
                 CategorySection(),
                 SizedBox(
                  height: 24,
                ),
                 PopularSection(),
                 SizedBox(
                  height: 24,
                ),
                NewArrivalsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


