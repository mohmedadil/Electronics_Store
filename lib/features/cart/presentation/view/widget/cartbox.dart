import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/features/cart/presentation/view_model/cubit/getcart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';

class CartBox extends StatefulWidget {
  const CartBox({
    super.key,
    required this.item,
  });
  final ItemModel item;

  @override
  State<CartBox> createState() => _CartBoxState();
}

class _CartBoxState extends State<CartBox> {
  int count = 1;

  _CartBoxState();
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xff0D6EFD)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (count > 0) {
                      count++;
                      BlocProvider.of<GetcartCubit>(context)
                          .add(widget.item.price as int);
                      BlocProvider.of<GetcartCubit>(context).refresh();
                      setState(() {});
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      count--;
                      BlocProvider.of<GetcartCubit>(context)
                          .add(-widget.item.price as int);
                      BlocProvider.of<GetcartCubit>(context).refresh();
                      setState(() {});
                    }
                  },
                  child: const Icon(
                    Icons.minimize,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              widget.item.cart = false;
              widget.item.delete();
              BlocProvider.of<GetcartCubit>(context).getCart();
            },
            icon: Icons.delete,
            backgroundColor: const Color(0xffFF1900),
            flex: 1,
            label: 'delete',
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 104,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Image.network(widget.item.image ?? '')),
          const SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Text(
                  widget.item.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Styles.textStyle16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$ ${widget.item.price}',
              )
            ],
          )
        ]),
      ),
    );
  }
}
