import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/presentation/splash/splash_screen.dart';
import 'package:bloc/bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Almost Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.bebasNeue().fontFamily,
      ),
      home: const SplashScreen(),
    );
  }
}
