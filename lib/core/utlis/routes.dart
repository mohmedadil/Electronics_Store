import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/features/authintication/login/presentation/views/login_view.dart';
import 'package:shoes_store/features/authintication/recovery/presentation/views/recovery_view.dart';
import 'package:shoes_store/features/authintication/recovery/presentation/views/verification_view.dart';
import 'package:shoes_store/features/authintication/register/presentation/views/register_view.dart';
import 'package:shoes_store/features/home/presentation/controler/cubit/home_cubit.dart';
import 'package:shoes_store/features/home/presentation/views/screens/details_view.dart';
import 'package:shoes_store/features/home/presentation/views/screens/favourite_view.dart';
import 'package:shoes_store/features/home/presentation/views/screens/home_view.dart';
import 'package:shoes_store/features/home/presentation/views/screens/searchView.dart';
import 'package:shoes_store/features/intro/presentation/views/intro.dart';

abstract class Routers {
  static const introduction = '/intro';
  static const kLogin = '/login';
  static const kregister = '/register';
  static const krecovery = '/recovery';
  static const kverify = '/verify';
  static const khome = '/home';
  static const kfavourite = '/favourite';
  static const kdetials = '/detials';
  static const ksearch = '/search';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: introduction,
      builder: (context, state) => const IntroView(),
    ),
    GoRoute(
      path: kLogin,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: ksearch,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: kregister,
      builder: (context, state) => RegisterView(),
    ),
    GoRoute(
      path: krecovery,
      builder: (context, state) => const RecoveryView(),
    ),
    GoRoute(
      path: kverify,
      builder: (context, state) => const VerificationView(),
    ),
    GoRoute(
      path: khome,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(),
        child: HomeView(),
      ),
    ),
    GoRoute(
      path: kfavourite,
      builder: (context, state) => const FavouriteView(),
    ),
    GoRoute(
      path: kdetials,
      builder: (context, state) => const DetailsView(),
    ),
  ]);
}
// HomeView(user: state.extra as UserCredential),
