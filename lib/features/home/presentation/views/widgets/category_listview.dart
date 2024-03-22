import 'package:flutter/material.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/category_box.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int count=0;
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