import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.item,
  });
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: Styles.textStyle20
                        .copyWith(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Brand :',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' ${item.brand}',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Color :',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' ${item.color}',
                        style: Styles.textStyle20.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    '\$ ${item.price.toString()}',
                    style: Styles.textStyle20
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Image.network(
                        item.image ?? '',
                        fit: BoxFit.fill,
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('asset/images/Slider.png')),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
