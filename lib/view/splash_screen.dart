import 'dart:async';

import 'package:covid19_app/routes/getx_routes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class CovidSplashScreen extends StatefulWidget {
  const CovidSplashScreen({super.key});

  @override
  State<CovidSplashScreen> createState() => _CovidSplashScreenState();
}

class _CovidSplashScreenState extends State<CovidSplashScreen>
    with TickerProviderStateMixin {
  //
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  //
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () =>
            // Only Goes Forward but Can't come back
            Get.offNamed(AppGetXRoutes.worldStatistics));
  }

  //
  @override
  void dispose() {
    _controller.dispose(); // Dispose of controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image(image: AssetImage('images/covid19.png')),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Text(
              'Covid-19\nTracker App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26,
                color: Colors.deepPurple, // Modern color touch
              ),
            ),
          ],
        ),
      )),
    );
  }
}
