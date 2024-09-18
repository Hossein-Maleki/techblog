import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/gen/assets.gen.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  CupertinoIcons.search,
                ),
                Assets.images.logo.image(height: size.height / 13.6),
                Icon(Icons.menu)
              ],
            ),
          ),
          Container(
              height: size.height / 4.2,
              width: size.width / 1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Assets.images.posterTest.provider())),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: GradientColors.homePosterCoverGradiant)))
        ],
      )),
    ));
  }
}
