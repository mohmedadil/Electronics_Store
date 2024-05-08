import 'package:Electronic_Store/features/cart/presentation/view/cart_view.dart';
import 'package:Electronic_Store/features/cart/presentation/view_model/cubit/getcart_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/search/search_cubit_cubit.dart';
import 'package:Electronic_Store/features/splash/presntation/view/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Electronic_Store/features/authintication/login/presentation/views/login_view.dart';
import 'package:Electronic_Store/features/authintication/recovery/presentation/views/recovery_view.dart';
import 'package:Electronic_Store/features/authintication/recovery/presentation/views/verification_view.dart';
import 'package:Electronic_Store/features/authintication/register/presentation/views/register_view.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/views/screens/details_view.dart';
import 'package:Electronic_Store/features/favourite/presentation/views/favourite_view.dart';
import 'package:Electronic_Store/features/home/presentation/views/screens/home_view.dart';
import 'package:Electronic_Store/features/home/presentation/views/screens/searchView.dart';
import 'package:Electronic_Store/features/intro/presentation/views/intro.dart';

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
  static const kcart = '/cart';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
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
      builder: (context, state) => BlocProvider(
        create: (context) => SearchCubitCubit(),
        child: const SearchScreen(),
      ),
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
      builder: (context, state) =>HomeView(user: state.extra as UserCredential),
    ),
    GoRoute(
      path: kfavourite,
      builder: (context, state) => const FavouriteView(),
    ),
    GoRoute(
      path: kdetials,
      builder: (context, state) => DetailsView(
        item: state.extra as ItemModel,
      ),
    ),
    GoRoute(
      path: kcart,
      builder: (context, state) => const CartView(),
    ),
  ]);
}
// HomeView(user: state.extra as UserCredential),
