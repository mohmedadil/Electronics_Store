import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/features/favourite/presentation/view_model/cubit/getfavourite_cubit.dart';
import 'package:Electronic_Store/features/favourite/presentation/views/widgets/favourite_box.dart';

class FavouriteGridView extends StatefulWidget {
  const FavouriteGridView({
    super.key,
    required this.shoes,
  });
  final List<ItemModel> shoes;

  @override
  State<FavouriteGridView> createState() => _FavouriteGridViewState();
}

class _FavouriteGridViewState extends State<FavouriteGridView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetfavouriteCubit>(context).getFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: BlocBuilder<GetfavouriteCubit, GetfavouriteState>(
        builder: (context, state) {
          if (state is GetfavouriteSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 2.9 / 3.8),
              itemCount: widget.shoes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(Routers.kdetials, extra: widget.shoes[index]);
                    },
                    child: FavouriteBox(
                      item: widget.shoes[index],
                    ));
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
