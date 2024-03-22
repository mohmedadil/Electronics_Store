import 'package:flutter/material.dart';
import 'package:shoes_store/core/utlis/styles.dart';

class CategoryBox extends StatefulWidget {
  const CategoryBox({
    super.key,
    this.isChoose = false,
    required this.shoes,
  });
  final bool isChoose;
  final String shoes;

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: widget.isChoose
          ? Container(
              width: 110,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xff0D6EFD),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                widget.shoes,
                style: Styles.textStyle14.copyWith(color: Color(0xffFFFFFF)),
              )),
            )
          : Container(
              width: 110,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                widget.shoes,
                style: Styles.textStyle14,
              )),
            ),
    );
  }
}
