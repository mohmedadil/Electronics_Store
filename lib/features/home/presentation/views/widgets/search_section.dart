import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 2),
                  blurRadius: 1,
                )
              ]),
          child: const SizedBox(
            width: 269,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xff6A6A6A),
                      fontSize: 12,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Looking For Shoes',
                    filled: true,
                    fillColor: Color(0XffFFFFFF),
                  )),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            backgroundColor: Color(0xff0D6EFD),
            radius: 25,
            child: Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
