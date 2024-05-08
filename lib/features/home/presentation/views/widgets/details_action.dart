import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/core/widgets/buttons.dart';
import 'package:Electronic_Store/features/favourite/presentation/view_model/cubit/getfavourite_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/add_cart/add_cart_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/add_favourite/addfavourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsAction extends StatefulWidget {
  const DetailsAction({
    super.key,
    required this.item,
  });
  final ItemModel item;

  @override
  State<DetailsAction> createState() => _DetailsActionState();
}

class _DetailsActionState extends State<DetailsAction> {
  _DetailsActionState();
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.item.isFavourite;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                if (widget.item.isFavourite == false) {
                  widget.item.isFavourite = true;
                  BlocProvider.of<AddfavouriteCubit>(context)
                      .addToFavourite(widget.item);

                  setState(() {});
                } else {
                  isSelected = false;
                  widget.item.isFavourite = false;
                  setState(() {});
                  widget.item.delete();
                  BlocProvider.of<GetfavouriteCubit>(context).getFavourite();
                }
              },
              child: isSelected
                  ? CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'asset/images/heart.png',
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      ))
                  : CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color(0xffD9D9D9),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'asset/images/heart.png',
                          fit: BoxFit.fill,
                        ),
                      )),
            ),
            Spacer(),
          ],
        ),
        Column(
          children: [
            Spacer(),
            widget.item.cart
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'Added To Cart',
                      style: Styles.textStyle18,
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ButtonActionWithIcon(
                      onTap: () {
                        try {
                          print('hell');
                          widget.item.cart = true;
                          BlocProvider.of<AddCartCubit>(context)
                              .addToCart(widget.item);
                        } catch (e) {
                          print(e.toString());
                        }

                        setState(() {});
                      },
                      icon: 'asset/images/bag-2.png',
                      text: 'Add to Cart',
                      color: const Color(0xff0D6EFD),
                    ),
                  ),
            Spacer()
          ],
        ),
      ],
    );
  }
}
