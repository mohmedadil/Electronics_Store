import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/features/favourite/presentation/view_model/cubit/getfavourite_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/add_favourite/addfavourite_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:Electronic_Store/features/home/presentation/view_model/provider/model.dart';
import 'package:Electronic_Store/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<ItemModel>('shoesbox');
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => Mystate(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()..getItem(),
            ),
            BlocProvider(
              create: (context) => AddfavouriteCubit(),
            ),
            BlocProvider(
              create: (context) => GetfavouriteCubit(),
            ),
          ],
          child: MaterialApp.router(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            routerConfig: Routers.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Raleway'),
          ),
        ),
      ),
    );
  }
}
