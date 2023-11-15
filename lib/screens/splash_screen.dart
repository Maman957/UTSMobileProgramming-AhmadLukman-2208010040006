import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resep_makanan_app/screens/login_screen.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => const LoginScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animation.json"),
            const SizedBox(height: 16),
            const CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
          ],
        ),
      )),
    );
  }
}
