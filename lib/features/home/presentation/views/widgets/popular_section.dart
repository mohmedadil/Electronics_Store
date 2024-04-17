import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/core/utlis/routes.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/popular_box.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Shoes',
              style: Styles.textStyle16,
            ),
            Text(
              'see all',
              style: Styles.textStyle14
                  .copyWith(fontSize: 14, color: const Color(0xff0D6EFD)),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Routers.kdetials);
                  },
                  child: PopularBox()),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Routers.kdetials);
                  },
                  child: PopularBox()),
            ],
          ),
        ),
      ],
    );
  }
}
