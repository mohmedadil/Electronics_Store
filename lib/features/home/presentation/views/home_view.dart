import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/features/home/presentation/controler/cubit/home_cubit.dart';
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
        backgroundColor: kBackgroundColor,
        drawer: const MyDrawer(),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return page[BlocProvider.of<HomeCubit>(context).page];
            },
          ),
        ),
      ),
    );
  }
}
