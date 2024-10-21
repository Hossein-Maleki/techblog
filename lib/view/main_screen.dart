 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/view/articels_intro.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profilescreen.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
 
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/service/lunch-url.dart';
 

 

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  Rx selectedPageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.asset(
              Assets.images.logo.path,
              scale: 3,
            )),
            const ListTile(title: Text("پروفایل کاربری")),
            const Divider(),
            ListTile(onTap: () => {}, title: Text(" درباره تک‌بلاگ")),
            const Divider(),
            ListTile(
                onTap: () async {
                  await Share.share(MyStrings.shareText);
                },
                title:  Text(MyStrings.shareTec)),
            const Divider(),
             ListTile(
              onTap:  () => myLaunchUrl(MyStrings.techBlogGithubUrl),
              title: Text("تک‌بلاگ در گیت هاب"))
          ],
        ),
      ),
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
            IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: Icon(Icons.menu))
          ],
        ),
      ),
      backgroundColor: SolidColors.scaffoldBg,
      body: Stack(children: [
        Positioned.fill(
          child:Obx(()=> IndexedStack(
            index: selectedPageIndex.value,
            children: [
              HomeScreen(size: size, textthem: textthem),
              ArticelsIntro(),
              Center(child: profilescreen(size: size, textthem: textthem))
            ],
          ),)
        ),
        ButtonNavigator(
          size: size,
           changePage: (int valeu) =>   selectedPageIndex.value = valeu
        )
      ]),
    );
  }
}

class ButtonNavigator extends StatelessWidget {
  ButtonNavigator({super.key, required this.size, required this. changePage});

  final Size size;
 final void Function(int) changePage;

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
                    onTap: () =>  changePage(2),
                    child: Assets.icons.user.image(width: 32)),
                InkWell(
                    onTap: () => changePage(1),
                    child: Assets.icons.write.image(width: 32)),
                InkWell(
                    onTap: () =>  changePage(0),
                    child: Assets.icons.home.image(width: 32))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
