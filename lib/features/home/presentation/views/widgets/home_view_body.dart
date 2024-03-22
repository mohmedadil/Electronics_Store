import 'package:flutter/material.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/category_section.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/newarrival_section.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/popular_section.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/search_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const SearchSection(),
          const SizedBox(
            height: 26,
          ),
          const CategorySection(),
          const SizedBox(
            height: 24,
          ),
          const PopularSection(),
          const SizedBox(
            height: 24,
          ),
          const NewArrivalsSection(),
        ],
      ),
    );
  }
}
