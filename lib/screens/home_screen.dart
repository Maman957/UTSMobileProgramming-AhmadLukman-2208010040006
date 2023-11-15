import 'package:flutter/material.dart';
import 'package:resep_makanan_app/screens/recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset("assets/food.png"),
              const Text("Explore your favorite food recipes"),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (builder) => const RecipeScreen()),
                  );
                },
                child: const Text("Explore Recipe"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
