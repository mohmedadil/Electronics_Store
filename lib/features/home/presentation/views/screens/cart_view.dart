import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/cart_details_box.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/cart_listview.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Cart',
                    style: Styles.textStyle18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '3 item',
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CartListView(),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: CartDetailsBox(),
          ),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 30.h,
        ))
      ],
    );
  }
}
