import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/core/utlis/routes.dart';

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
                ? () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('skipIntro', true);

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

class ButtonAction extends StatelessWidget {
  const ButtonAction({
    super.key,
    this.onTap,
    required this.color,
    this.textColor,
    required this.text,
  });
  final Color color;
  final Color? textColor;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              alignment: Alignment.bottomCenter,
              height: 50.h,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway'),
                ),
              )),
        ),
      ],
    );
  }
}

class ButtonActionWithIcon extends StatelessWidget {
  const ButtonActionWithIcon({
    super.key,
    this.onTap,
    required this.color,
    this.textColor,
    required this.text,
    required this.icon,
  });
  final String icon;
  final Color color;
  final Color? textColor;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              alignment: Alignment.bottomCenter,
              height: 50,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      icon,
                      cacheHeight: 22,
                      cacheWidth: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
