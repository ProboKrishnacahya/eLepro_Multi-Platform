import 'package:elepro/views/pages/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color colorPrimary = Colors.blue;
  final Color colorSecondary = Colors.white;
  final Color textPrimary = Colors.black;
  // final TextStyle bold = TextStyle(fontWeight: FontWeight.w800);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eLepro',
      theme: ThemeData(
        primaryColor: colorPrimary,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              bodyColor: textPrimary,
              displayColor: textPrimary,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorPrimary),
            foregroundColor: MaterialStateProperty.all<Color>(colorSecondary),
            // textStyle: MaterialStateProperty.all<TextStyle>(bold),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorSecondary),
            foregroundColor: MaterialStateProperty.all<Color>(colorPrimary),
          ),
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 0),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: 256,
              height: 256,
            ),
            Text(
              'eLepro',
              style: Theme.of(context).textTheme.headlineLarge?.merge(
                    TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
