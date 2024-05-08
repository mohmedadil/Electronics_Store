import 'package:Electronic_Store/features/cart/presentation/view_model/cubit/getcart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/core/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDetailsBox extends StatefulWidget {
  const CartDetailsBox({
    super.key,
  });

  @override
  State<CartDetailsBox> createState() => _CartDetailsBoxState();
}

class _CartDetailsBoxState extends State<CartDetailsBox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetcartCubit, GetcartState>(
      builder: (context, state) {
        if (state is GetcartSuccess) {
          return Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal',
                      style: Styles.textStyle16,
                    ),
                    Text(
                      '\$ ${BlocProvider.of<GetcartCubit>(context).count}',
                      style: Styles.textStyle16,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery',
                      style: Styles.textStyle16,
                    ),
                    Text(
                      '\$60.20',
                      style: Styles.textStyle16,
                    )
                  ],
                ),
                const Text(
                  '---------------------------------------------------------------------------------------',
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Cost',
                      style: Styles.textStyle16,
                    ),
                    Text(
                      '\$ ${BlocProvider.of<GetcartCubit>(context).count + 60} ',
                      style: Styles.textStyle16
                          .copyWith(color: const Color(0xff0D6EFD)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonAction(
                  color: const Color(0xff0D6EFD),
                  text: 'CheckOut',
                  onTap: () {},
                )
              ]),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
