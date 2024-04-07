import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store/core/utlis/routes.dart';
import 'package:shoes_store/features/home/presentation/controler/cubit/home_cubit.dart';
import 'package:shoes_store/features/home/presentation/controler/provider/model.dart';
import 'package:shoes_store/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: ChangeNotifierProvider(create: (context) => Mystate(),
        child: MaterialApp.router(
          routerConfig: Routers.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
