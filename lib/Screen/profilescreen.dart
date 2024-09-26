import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:techblog/Screen/components/component.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({
    super.key,
    required this.size,
    required this.textthem,
  });

  final Size size;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.profileAvatar.image(width: size.width / 4),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.bluePen.image(width: 20),
                SizedBox(
                  width: 6,
                ),
                Text(MyStrings.imageProfileEdit,
                    style: TextStyle(
                      color: SolidColors.seeMore,
                    ))
              ],
            ),
            SizedBox(height: 60),
            Column(children: [
              Text("فاطمه امیری"),
              SizedBox(height: 6),
              Text(" fatemeamiri@gmail.com")
            ]),
            SizedBox(height: 40),
            TechDivider(size: size),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onDoubleTap: () {},
              splashColor: SolidColors.primaryColor.withAlpha(1),
              child: SizedBox(
                width: size.width / 1.5,
                height: 32,
                child: Center(
                  child: Text(MyStrings.myFavBlog),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onDoubleTap: () {},
              splashColor: SolidColors.primaryColor.withAlpha(1),
              child: SizedBox(
                width: size.width / 1.5,
                height: 32,
                child: Center(
                  child: Text(MyStrings.myFavPodcast),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onDoubleTap: () {},
              splashColor: SolidColors.primaryColor.withAlpha(1),
              child: SizedBox(
                width: size.width / 1.5,
                height: 32,
                child: Center(
                  child: Text(MyStrings.logOut),
                ),
              ),
            ),
            SizedBox(
              height: 140 ,
            )
          ],
        ),
      ),
    );
  }
}
