import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Screens/home_screen.dart';
import 'package:techblog/Screens/profilescreen.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

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
        Positioned.fill(
          child: IndexedStack(
                    index: selectedPageIndex,
                    children: [
          HomeScreen(size: size, textthem: textthem),
          Center(child: profilescreen(size: size, textthem: textthem))
                    ],
                  ),
        ),
        ButtonNavigator(
          size: size,
          chengepage: (int valeu) => setState(() {
            selectedPageIndex = valeu;
          }),
        )
      ]),
    );
  }
}

class ButtonNavigator extends StatelessWidget {
  ButtonNavigator({super.key, required this.size, required this.chengepage});

  final Size size;
  final Function(int) chengepage;
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
                InkWell(
                    onTap: () => chengepage(1),
                    child: Assets.icons.user.image(width: 32)),
                InkWell(
                    onTap: () => chengepage(2),
                    child: Assets.icons.write.image(width: 32)),
                InkWell(
                    onTap: () => chengepage(0),
                    child: Assets.icons.home.image(width: 32))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
