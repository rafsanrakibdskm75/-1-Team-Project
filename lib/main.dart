import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chating/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(DefaultFirebaseOptions.currentPlatform);
  runApp((MyApp));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Live Chat',
      theme: AppTheme.lightTheme,
      //initialRoute: AppPages.initial,
      //getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

    );
    
  }
}

