import 'package:Electronic_Store/features/cart/presentation/view_model/cubit/getcart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:Electronic_Store/features/cart/presentation/view/widget/cartbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
  });

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<GetcartCubit, GetcartState>(builder: (context, state) {
        if (state is GetcartSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.items.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CartBox(
                      
                      item: state.items[index],
                    ),
                  ));
        } else {
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
