import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/category_listview.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = Provider.of<Mystate>(context).isSelected;

    return isSelected
        ? Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Category',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const CategoryListView(),
            ],
          )
        : Container();
  }
}
