import 'package:elepro/utils/style_helper.dart';
import 'package:elepro/views/pages/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eLepro',
      theme: ThemeData(
        primaryColor: Style.blue,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              bodyColor: Style.black,
              displayColor: Style.black,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all<Color>(Style.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Style.white),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all<Color>(Style.white),
            foregroundColor: MaterialStateProperty.all<Color>(Style.blue),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(Size.zero),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/logo.png',
            width: 256,
            height: 256,
          ),
          SizedBox(
            height: 16,
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
    );
  }
}
