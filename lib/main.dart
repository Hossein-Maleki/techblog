import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/Screens/articels_intro.dart';
import 'package:techblog/Screens/splash_screen.dart';
import 'package:techblog/constans/const_colors.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      statusBarColor: SolidColors.statusBarColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        //  const Locale('en', ''), // پشتیبانی از انگلیسی
        const Locale('fa', ''), // پشتیبانی از فارسی
      ],
      theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(
              headlineLarge: TextStyle(
                  fontFamily: "iransans",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: SolidColors.posterTitle),
              headlineMedium: TextStyle(
                  fontFamily: "iransans",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.posterSubTitle), headlineSmall: TextStyle(
                  fontFamily: "iransans",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.hashTag),bodyMedium: TextStyle(
                  fontFamily: "iransans",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: SolidColors.blackColor))),
      // home: SplashScreen(),
      home: ArticelsIntro(),
    );
  }
}
