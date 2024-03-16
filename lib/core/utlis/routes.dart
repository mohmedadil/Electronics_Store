import 'package:go_router/go_router.dart';
import 'package:shoes_store/features/authintication/login/login.dart';
import 'package:shoes_store/features/intro/presentation/views/intro.dart';
import 'package:shoes_store/features/splash/presntation/view/splash_view.dart';

abstract class Routers {
  static const introduction = '/intro';
    static const kLogin = '/login';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: introduction,
      builder: (context, state) => const IntroView(),
    ),
    GoRoute(
      path: kLogin,
      builder: (context, state) => const LoginScreen(),
    )
  ]);
}
