import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';
import 'Home/Home.dart';

void main() {

  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,

      theme : ThemeData.light().copyWith(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xffFF6363),
          onPrimary: Colors.white,
          secondary: Color(0xffFF6363),
          onSecondary: Colors.white,
          error : Colors.red,
          onError: Colors.red,

        ),
        scaffoldBackgroundColor: Color(0xffBAFFB4),
        cardColor: Color(0xffFFAB76),
        errorColor: Colors.red,

      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: DbackgroundColor,
          onPrimary: Colors.white,

          error: Colors.red,
          onError: Colors.red,

          background: Colors.black12,
          onBackground: Colors.white54,

          secondary: Colors.black54,
          onSecondary: Colors.white,

          surface: Colors.black,
          onSurface: Colors.black,

          primaryVariant: Colors.black26,
          secondaryVariant: Colors.black26,
        ),
      ).copyWith(
        textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith((state) => Colors.white) , backgroundColor:MaterialStateProperty.resolveWith((state) => Colors.transparent) )),
      ),


      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(child:Home()),
    );
  }
}



