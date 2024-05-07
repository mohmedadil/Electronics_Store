import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/popular_box.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Shoes',
                    style: Styles.textStyle16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: 2.9 / 3.8),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .push(Routers.kdetials, extra: state.item[index]);
                        },
                        child: PopularBox(
                          shoes: state.item[index],
                        ),
                      ),
                    );
                  } else if (state is HomeLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text('There was an problem');
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
