import 'package:flutter/material.dart';
import 'package:signease/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Signease',
      theme: ThemeData(
        fontFamily: "Oswald",
      ),
    );
  }
}

