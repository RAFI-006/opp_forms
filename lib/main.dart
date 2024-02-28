import 'package:flutter/material.dart';
import 'package:opp_forms/ui/form_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opp Stack Creation Form',
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Gilroy',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff655EB7)),
          useMaterial3: true),
      home: const FormView(),
    );
  }
}
