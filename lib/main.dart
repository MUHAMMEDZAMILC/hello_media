import 'package:flutter/material.dart';
import 'package:hello_media/controller/shared_pref.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/pages/splash/splashpage.dart';
import 'package:provider/provider.dart';

import 'controller/provider/provideroperation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderOperation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hello Media',
        theme: MyTheme.theme,
        home: const SplashScreen(),
      ),
    );
  }
}

