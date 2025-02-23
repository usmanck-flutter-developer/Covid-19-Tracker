import 'package:covid19_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/getx_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // make MaterialApp into GetMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Mention GetX Routes here
      initialRoute: '/', // Set initial route
      getPages: AppGetXRoutes.getxRoutes,
      // End
      title: 'Covid App',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              backgroundColor: Colors.deepPurple.shade500,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
      home: const CovidSplashScreen(),
    );
  }
}
