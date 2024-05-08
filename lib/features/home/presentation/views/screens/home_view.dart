import 'package:Electronic_Store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/menu.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
    required this.user,
  });
  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).user = user;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: const BottomBar(),
          extendBody: true,
          backgroundColor: kBackgroundColor,
          drawer: MyDrawer(
            user: user,
          ),
          body: Selector<Mystate, int>(
            selector: (context, value) => value.number,
            builder: (context, value, child) => page[value],
          )),
    );
  }
}
