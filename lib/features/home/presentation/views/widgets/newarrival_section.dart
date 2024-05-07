import 'package:flutter/material.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({
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
              'New Arrivals',
              style: Styles.textStyle16,
            ),
            Text(
              'see all',
              style: Styles.textStyle14
                  .copyWith(fontSize: 14, color: const Color(0xff0D6EFD)),
            ),
          ],
        ),
        Image.asset('asset/images/5.PNG'),
      ],
    );
  }
}
