import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/features/home/presentation/controler/cubit/home_cubit.dart';
import 'package:shoes_store/features/home/presentation/controler/provider/model.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int num = 0;
  List<bool> isChoose = [true, false, false, false];
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        height: 60,
        buttonBackgroundColor: const Color(0xff0D6EFD),
        backgroundColor: Colors.transparent,
        index: num,
        onTap: (value) {
          for (int i = 0; i < 4; i++) {
            if (i == value) {
              isChoose[value] = true;
            } else {
              isChoose[i] = false;
            }
            setState(() {});
          }
          Provider.of<Mystate>(context, listen: false).setPage(value);
        },
        items: [
          isChoose[0]
              ? Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'asset/images/home-2.png',
                    color: Colors.white,
                  ),
                )
              : Image.asset(
                  'asset/images/home-2.png',
                ),
          isChoose[1]
              ? Container(
                  width: 40,
                  height: 40,
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )),
                )
              : Container(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    'asset/images/heart.png',
                    fit: BoxFit.cover,
                  ),
                ),
          isChoose[2]
              ? Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'asset/images/bag-2.png',
                    color: Colors.white,
                  ),
                )
              : Image.asset('asset/images/bag-2.png'),
          isChoose[3]
              ? Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'asset/images/frame.png',
                    color: Colors.white,
                  ),
                )
              : Image.asset('asset/images/frame.png'),
        ]);
  }
}
