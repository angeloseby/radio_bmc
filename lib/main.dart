import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_bmc/config/color_scheme.dart';
import 'package:radio_bmc/utils/radio_provider.dart';

import 'pages/homepage.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio BMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TColorScheme.mainColor),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
