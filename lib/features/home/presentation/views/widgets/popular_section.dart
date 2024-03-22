import 'package:flutter/material.dart';
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
        const Row(
          children: [
            PopularBox(),
            SizedBox(
              width: 20,
            ),
            PopularBox(),
          ],
        ),
      ],
    );
  }
}
