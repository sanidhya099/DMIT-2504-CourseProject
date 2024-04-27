import 'package:flutter/material.dart';
import 'petdetail.dart'; // Import the PetDetailsForm widget from petdetail.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PetDetailsForm(), // Set PetDetailsForm as the home page
    );
  }
}
