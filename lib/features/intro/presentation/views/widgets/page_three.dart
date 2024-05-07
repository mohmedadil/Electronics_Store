import 'package:flutter/material.dart';
import 'package:Electronic_Store/features/intro/presentation/views/widgets/page_one.dart';

class PageThree extends StatelessWidget {
  const PageThree({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1483C2),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            width: 77,
                            height: 77,
                            child: Image.asset(
                              'asset/images/Misc_04.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 339,
                      height: 339,
                      child: AspectRatio(
                        aspectRatio: 1 / 2,
                        child: Image.asset(
                          'asset/images/Aire Jordan Nike.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250, left: 70),
                      child: Container(
                          child: Image.asset('asset/images/Ellipse 3.png')),
                    ),
                  ],
                ),
                const Text(
                  'You Have the \n Power To',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Raleway',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'There Are Many Beautiful And Attractive \n Plants To Your Room',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      color: Color(0xffD8D8D8),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                //  Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                //   child: ActionButton(firstPage: false,onPressed: onPressed,),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
