import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_makanan_app/provinder/favorite_provinder.dart';
import 'package:resep_makanan_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MaterialApp(
        home: SplashScreens(),
      ),
    );
  }
}
