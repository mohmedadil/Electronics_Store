import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/core/utlis/routes.dart';
import 'package:shoes_store/core/widgets/buttons.dart';
import 'package:shoes_store/features/intro/presentation/views/widgets/page_one.dart';
import 'package:shoes_store/features/intro/presentation/views/widgets/page_three.dart';
import 'package:shoes_store/features/intro/presentation/views/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  PageController controller = PageController();
  bool firstPage = true;
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            ToTrackPages(index);
          },
          controller: controller,
          children: const [
            PageOne(),
            PageTwo(),
            PageThree(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 20,
                  dotColor: Color(0xffFFB21A),
                  activeDotColor: Colors.white)),
        ),
        ButtonActions(
            lastPage: lastPage, controller: controller, firstPage: firstPage),
      ],
    ));
  }

  void ToTrackPages(int index) {
    if (index == 1 || index == 2) {
      firstPage = false;
      setState(() {});
    } else {
      firstPage = true;
      setState(() {});
    }
    if (index == 2) {
      lastPage = true;
      setState(() {});
    }
  }
}
