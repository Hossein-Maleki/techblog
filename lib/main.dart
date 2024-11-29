import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/binding.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/service/api-provider.dart';
import 'package:techblog/view/articels_screen/articels_intro.dart';
import 'package:techblog/view/articels_screen/articels_list.dart';
import 'package:techblog/view/articels_screen/managment_articels.dart';
import 'package:techblog/view/main_screen/home_screen.dart';
import 'package:techblog/view/main_screen/main_screen.dart';

import 'package:techblog/view/splash_screen.dart';
import 'package:techblog/constans/const_colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      statusBarColor: SolidColors.statusBarColor));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textthem = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;
    return GetMaterialApp(
      locale: const Locale('fa', ''),
      debugShowCheckedModeBanner: false,
  initialBinding: HomeScreenBinding(),
      getPages: [
        GetPage(name: MyAppScren.homeScreen, page: () => HomeScreen()),
        GetPage(name: MyAppScren.mainScreen, page: () => MainScreen(),binding: ArticelsBinding()),
        GetPage( name: MyAppScren.articelsIntro, page: () => ArticelsIntroScreen() ,binding: RegisterBinding()),
        GetPage(name: MyAppScren.splashScreen, page: () => const SplashScreen()),
        GetPage(name: MyAppScren.managmentArticels, page: () =>   ManagmentArticelsScreen(),binding: ManegmentBinding())
      ],
      theme: genLightTheme(),
      home: SplashScreen(),
    );
  }

  ThemeData genLightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          // filled: true,
          outlineBorder:
              BorderSide(color: const Color.fromARGB(255, 103, 194, 0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          //  textStyle: textthem.labelLarge,
          backgroundColor: (SolidColors.primaryColor),
          //foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          bodySmall: TextStyle(
              fontFamily: "iransans",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(180, 97, 97, 97)),
          labelLarge: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "iransans",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        labelMedium: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "iransans",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ), 
          labelSmall: TextStyle(
              fontFamily: "iransans",
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color.fromARGB(255, 219, 219, 219)),
          titleLarge: TextStyle(
              fontFamily: "iransans",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0), ),
              titleMedium : TextStyle(
              fontFamily: "iransans",
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0))),
    );
  }
}

class MyAppScren {
  static const String splashScreen = "/ ";
  static const String mainScreen = "/mainscreen";
  static const String homeScreen = "/homescreen";
  static const String articelsIntro = "/Articelintro";
  static const String managmentArticels = "/managmentarticels";
}
