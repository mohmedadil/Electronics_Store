import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';

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
        Expanded(
          child: CustomSearchBar(
              issearching: false,
              ontap: () {
                GoRouter.of(context).push(Routers.ksearch);
              }),
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

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.ontap, required this.issearching});
  final void Function()? ontap;
  final bool issearching;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0, 2),
          blurRadius: 1,
        )
      ]),
      child: SizedBox(
        // width: 269,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                    onTap: ontap,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
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
              issearching
                  ? Container(
                      decoration: BoxDecoration(color: Color(0XffFFFFFF)),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff707B81),
                            ),
                            width: 0.8,
                            height: 30,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.mic)),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
