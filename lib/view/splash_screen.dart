import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/view/articels_screen/articels_list.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/gen/assets.gen.dart';
 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>   MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.logo.image(
              width: 200,
            ),
            SizedBox(
              height: 24,
            ),
            SpinKitFadingCube(
              size: 32,
              color: SolidColors.primaryColor,
            )
          ],
        ),
      )),
    );
  }
}
