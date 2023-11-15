import 'package:flutter/material.dart';
import 'package:resep_makanan_app/screens/home_screen.dart';
import 'package:tf_form/tf_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _controlerFirst = TextEditingController();
  final TextEditingController _controlerLast = TextEditingController();
  final FocusNode _firstFocus = FocusNode();
  final FocusNode _lastFocus = FocusNode();

  String? email;

  void onSubmit() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      setState(() {
        email = _controlerLast.text;
      });

      Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => const HomeScreen()),
      );

      _controlerLast.clear();
      _controlerFirst.clear();
    }
  }

  @override
  void dispose() {
    _controlerFirst.dispose();
    _controlerLast.dispose();
    _firstFocus.dispose();
    _lastFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MyRecipe",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  height: 150,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TFTextField(
                          hintText: "First Name",
                          controller: _controlerFirst,
                          focusNode: _firstFocus,
                          validationTypes: const [
                            TFValidationType.required,
                          ],
                        ),
                        const SizedBox(height: 16),
                        TFTextField(
                          hintText: "Last Name",
                          controller: _controlerLast,
                          focusNode: _lastFocus,
                          validationTypes: const [
                            TFValidationType.required,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Set fokus terakhir sebelum memvalidasi
                  _lastFocus.requestFocus();
                  onSubmit();
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
