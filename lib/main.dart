import 'package:flutter/material.dart';
import 'package:shoes_store/core/utlis/routes.dart';

void main()  {
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routers.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
