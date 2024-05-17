import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
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
                        Image.asset('asset/images/Highlight_10.png'),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset('asset/images/Misc_04.png'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.height * 0.3,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset('asset/images/iphone.png')),
                      ],
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    child: Image.asset('asset/images/Ellipse 3.png')),
                const Text(
                  'Lets Start \n   The Journey',
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
                  'Smart, Gorgeous & Cheaper \n Collection Explor Now',
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
