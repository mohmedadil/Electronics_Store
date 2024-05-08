import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              child: Icon(Icons.arrow_back)),
        ),
        const Text(
          'Electronic Shop',
          style: Styles.textStyle16,
        ),
        Stack(alignment: AlignmentDirectional.topEnd, children: [
          CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Image.asset('asset/images/bag-2.png')),
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 5,
            ),
          )
        ])
      ],
    );
  }
}
