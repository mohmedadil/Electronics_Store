import 'package:flutter/material.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/cartbox.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: CartBox(),
              )),
    );
  }
}



