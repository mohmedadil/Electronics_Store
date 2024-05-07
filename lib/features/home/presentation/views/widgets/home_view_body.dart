import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/category_section.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/popular_section.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/search_section.dart';

class HomeViewBody extends StatefulWidget {
  HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
          Selector<Mystate, bool>(
              selector: (context, value) => value.isSelected,
              builder: (context, value, child) => const CategorySection()),
          const SizedBox(
            height: 24,
          ),
          Expanded(child: PopularSection()),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
