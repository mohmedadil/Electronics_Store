import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/features/home/presentation/views/screens/details_view.dart';
import 'package:flutter/material.dart';
class BoxOfMoreDetails extends StatefulWidget {
  const BoxOfMoreDetails({
    super.key,
    required this.description,
  });
  final String description;
  @override
  State<BoxOfMoreDetails> createState() => _BoxOfMoreDetailsState();
}

class _BoxOfMoreDetailsState extends State<BoxOfMoreDetails> {
  bool seeMore = false;

  _BoxOfMoreDetailsState();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description,
              style: Styles.textStyle14,
              overflow: TextOverflow.fade,
              maxLines: seeMore ? 10 : 2,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    seeMore = true;
                    setState(() {});
                  },
                  child: seeMore
                      ? Container()
                      : Text(
                          'Read More',
                          style: Styles.textStyle14
                              .copyWith(color: const Color(0xff0D6EFD)),
                        ),
                )),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}