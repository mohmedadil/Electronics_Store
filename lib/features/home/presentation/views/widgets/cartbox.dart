import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoes_store/constat.dart';
import 'package:shoes_store/core/utlis/styles.dart';

class CartBox extends StatefulWidget {
  const CartBox({
    super.key,
  });

  @override
  State<CartBox> createState() => _CartBoxState();
}

class _CartBoxState extends State<CartBox> {
  int count = 1;

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
            onPressed: (context) {},
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
              child: Image.asset('asset/images/nikeblue.png')),
          const SizedBox(
            width: 30,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nike Club Max',
                style: Styles.textStyle16,
              ),
              Text(
                '584.95',
              )
            ],
          )
        ]),
      ),
    );
  }
}
