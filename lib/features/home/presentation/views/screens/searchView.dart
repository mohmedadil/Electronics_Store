import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/search/search_cubit_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/popular_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/search_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Search View',
          style: Styles.textStyle18,
        ),
        leading: BackButton(),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              'Cancel',
              style: Styles.textStyle16.copyWith(
                  color: Color(0xff0D6EFD), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                CustomSearchBar(
                  issearching: true,
                  onChanged: (value) {
                    var items = BlocProvider.of<HomeCubit>(context).item;
                    BlocProvider.of<SearchCubitCubit>(context)
                        .ForSearch(value, items);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Item',
                      style: Styles.textStyle18,
                    )),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<SearchCubitCubit, SearchCubitState>(
                  builder: (context, state) {
                    if (state is SearchCubitSuccess) {
                      if (state.items.length == 0) {
                        return Text('Item Not Found');
                      } else {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.9 / 3.8),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(Routers.kdetials,
                                  extra: state.items[index]);
                            },
                            child: PopularBox(
                              shoes: state.items[index],
                            ),
                          ),
                        );
                      }
                    } else {
                      return Text('Start Search');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
