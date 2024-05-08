import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/features/cart/presentation/view_model/cubit/getcart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/cart/presentation/view/widget/cart_details_box.dart';
import 'package:Electronic_Store/features/cart/presentation/view/widget/cart_listview.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<ItemModel> items;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetcartCubit>(context).getCart();
    items = BlocProvider.of<GetcartCubit>(context).item;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetcartCubit, GetcartState>(
      builder: (context, state) {
        if (state is GetcartSuccess) {
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
                              '${state.items.length} item',
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
