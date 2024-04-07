import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/features/home/presentation/controler/provider/model.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({
    super.key,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mystate>(context, listen: false);
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
          onPressed: () {
            provider.isSelected
                ? provider.setisSelected(false)
                : provider.setisSelected(true);
            setState(() {});
          },
          icon: provider.isSelected
              ? const CircleAvatar(
                  backgroundColor: Color(0xff0D6EFD),
                  radius: 25,
                  child: Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                )
              : const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(
                    Icons.tune,
                    color: Colors.black,
                  ),
                ),
        )
      ],
    );
  }
}
