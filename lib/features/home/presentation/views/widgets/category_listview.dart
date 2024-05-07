import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/category_box.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  count = index;
                  if (index == 0) {
                    BlocProvider.of<HomeCubit>(context).getItem();
                  } else {
                    BlocProvider.of<HomeCubit>(context)
                        .getCategoryItem(category[index]);
                  }
                });
              },
              child: CategoryBox(
                isChoose: count == index,
                shoes: category[index],
              ));
        },
      ),
    );
  }
}
