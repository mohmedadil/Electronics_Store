import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/features/home/presentation/controler/cubit/home_cubit.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/category_box.dart';

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
                    BlocProvider.of<HomeCubit>(context).getshoes('shoes');
                  } else {
                    BlocProvider.of<HomeCubit>(context)
                        .getshoes(category[index] + 'shoes');
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
