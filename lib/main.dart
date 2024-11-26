import 'package:flutter/material.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/pages/splash/splashpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.theme,
      home: const SplashScreen(),
    );
  }
}

