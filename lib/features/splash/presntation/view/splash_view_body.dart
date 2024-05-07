import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState() {
    super.initState();
    doAnimation();
    toNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xff0D6EFD)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/images/logo.png',
            width: MediaQuery.of(context).size.width * .7,
          ),
          FadeTransition(
            opacity: fadingAnimation!,
            child: const Text(
              'Shoes Store',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Raleway'),
            ),
          )
        ],
      ),
    );
  }

  void toNavigate() async {
    Future.delayed(
      Duration(seconds: 2),
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool skipIntro = prefs.getBool('skipIntro') ?? false;
        skipIntro
            ? GoRouter.of(context).push(Routers.kLogin)
            : GoRouter.of(context).push(Routers.introduction);
      },
    );
  }

  void doAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController?.forward();
    animationController?.repeat(reverse: true);
  }
}
