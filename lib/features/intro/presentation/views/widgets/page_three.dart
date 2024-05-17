import 'package:flutter/material.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .4,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              'asset/images/logo.webp',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'There Are Many Beautiful And Attractive \n Electronics To Your Room',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      color: Color(0xffD8D8D8),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
