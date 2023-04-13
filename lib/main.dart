import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/servises/servises.dart';
import 'package:provider/provider.dart';
import 'landing.dart';

void main() async {
  // DBConnection().connectDB();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyThemeApp());
}

class MyThemeApp extends StatelessWidget {
  const MyThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
     return StreamProvider.value(
      value: DBConnection().currentUser,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: AuthPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(),
          '/home': (context) => HomePage(),
          // '/test':(context) => const TestWidget(),
        },
      ),
    );
  }
}
