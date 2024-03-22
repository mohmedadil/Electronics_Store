import 'package:flutter/material.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/category_listview.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select Category',
            style: Styles.textStyle16
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
       const SizedBox(
          height: 16,
        ),
     const   CategoryListView(),
      ],
    );
  }
}
