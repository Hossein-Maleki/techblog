import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/service/api-provider.dart';
import 'package:techblog/view/home_screen.dart';
 
import 'package:techblog/view/splash_screen.dart';
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
    var textthem = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;
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
        inputDecorationTheme: InputDecorationTheme(
            // filled: true,
            outlineBorder:
                BorderSide(color: const Color.fromARGB(255, 103, 194, 0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //  textStyle: textthem.labelLarge,
            backgroundColor: (SolidColors.primaryColor),
            //foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontFamily: "iransans",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle),
            headlineMedium: TextStyle(
                fontFamily: "iransans",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: SolidColors.posterSubTitle),
            headlineSmall: TextStyle(
                fontFamily: "iransans",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: SolidColors.hashTag),
            bodyMedium: TextStyle(
                fontFamily: "iransans",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: SolidColors.blackColor),
            bodyLarge: TextStyle(
                fontFamily: "iransans",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 255, 255)),
            labelLarge: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "iransans",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            labelSmall: TextStyle(
                fontFamily: "iransans",
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color.fromARGB(255, 219, 219, 219))),
      ),
      // home: SplashScreen(),
      home: SplashScreen(),
    );
  }
}
