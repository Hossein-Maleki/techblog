import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:techblog/Screen/home_screen.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/model/fake_data/data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
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
      backgroundColor: SolidColors.scaffoldBg,
      body: Stack(children: [
        HomeScreen(size: size, textthem: textthem),
        ButtonNavigator(size: size)
      ]),
    );
  }
}

class ButtonNavigator extends StatelessWidget {
  const ButtonNavigator({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: GradientColors.bottomNavBackground)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 12, 26, 0),
          child: Container(
            
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(colors: GradientColors.bottomNav)),
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.icons.user.image(width: 32),
                Assets.icons.write.image(width: 32),
                
                IconButton(
                  splashRadius: 1,
                 
                  onPressed: () {  },
                icon: Assets.icons.home.image(width: 32) ,
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
