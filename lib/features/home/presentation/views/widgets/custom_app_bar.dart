import 'package:flutter/material.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: onTap, child: Image.asset('asset/images/Hamburger.png')),
        Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Image.asset('asset/images/Highlight_05 (1).png'),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 5),
                    child: Text(
                      'Explore',
                      style: Styles.textStyle30.copyWith(fontSize: 32),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Stack(alignment: AlignmentDirectional.topEnd, children: [
          CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Image.asset('asset/images/bag-2.png')),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
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
