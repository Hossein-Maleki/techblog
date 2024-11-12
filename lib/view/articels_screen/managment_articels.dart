import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/components/component.dart';

class ManagmentArticelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: genAppBar("مدیریت مقالات"),
        backgroundColor: SolidColors.statusBarColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: Assets.images.emptyState.image(scale: 3)),
            const SizedBox(height: 20),
            Text(
              MyStrings.articleEmpty,
              textAlign: TextAlign.center,
              style: textthem.labelMedium,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  MyStrings.textManageArticle,
                  style: textthem.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
