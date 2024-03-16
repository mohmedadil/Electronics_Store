import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/core/utlis/routes.dart';
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
        ButtonActions(lastPage: lastPage, controller: controller, firstPage: firstPage),
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

class ButtonActions extends StatelessWidget {
  const ButtonActions({
    super.key,
    required this.lastPage,
    required this.controller,
    required this.firstPage,
  });

  final bool lastPage;
  final PageController controller;
  final bool firstPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: GestureDetector(
            onTap: lastPage
                ? ()  {
                  
                    GoRouter.of(context).push(Routers.kLogin);
                  }
                : () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
            child: Container(
                alignment: Alignment.bottomCenter,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xffECECEC),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: firstPage
                      ? const Text(
                          'Get Started',
                          style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Raleway'),
                        )
                      : const Text(
                          'Next',
                          style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Raleway'),
                        ),
                )),
          ),
        ),
      ],
    );
  }
}
