import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Electronic_Store/constat.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';

class FavouriteBox extends StatelessWidget {
  const FavouriteBox({
    super.key,
    required this.item,
  });
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.29,
        child: AspectRatio(
          aspectRatio: 2.9 / 3.8,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.29 * 0.5,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Image.network(item.image ?? ""),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: kBackgroundColor,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 18,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const Text(
                    'BEST SELLER',
                    style: TextStyle(fontSize: 12, color: Color(0xff0D6EFD)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    item.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6A6A6A)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${item.price.toString()}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6A6A6A)),
                        ),
                       const Row(
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0xffCB1D1D),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0xff0B2F8B),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
