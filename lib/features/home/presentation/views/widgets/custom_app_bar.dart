import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';
import 'package:flutter/material.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          GestureDetector(
            onTap: () {
              Provider.of<Mystate>(context, listen: false).setPage(2);
            },
            child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Image.asset('asset/images/bag-2.png')),
          ),
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
