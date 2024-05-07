import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/favourite/presentation/view_model/cubit/getfavourite_cubit.dart';
import 'package:Electronic_Store/features/favourite/presentation/views/widgets/favouriteGridView.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/add_favourite/addfavourite_cubit.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  late List<ItemModel> shoes;
  @override
  void initState() {
    super.initState();
    shoes = BlocProvider.of<GetfavouriteCubit>(context).getFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: const Text(
            'Favourite',
            style: Styles.textStyle18,
          ),
          centerTitle: true,
        ),
        body: FavouriteGridView(
          shoes: shoes,
        ),
      ),
    );
  }
}
