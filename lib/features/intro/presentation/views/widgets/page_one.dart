import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xff1483C2),
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 300,
                              alignment: Alignment.topCenter,
                              child: const Text(
                                'Welcome to \n   our Store',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                alignment: Alignment.bottomLeft,
                                child: Image.asset(
                                    'asset/images/Highlight_05.png')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Container(
                        child: Image.asset('asset/images/Vector.png')),
                  ),
                ],
              ),
              //  Padding(
              //   padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              //   child: ActionButton(firstPage: true, onPressed: onPressed,),
              // ),
              Spacer(),
              Image.asset('asset/images/laptop.png'),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
