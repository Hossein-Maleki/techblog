import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/view/components/component.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data/data.dart';
 

class Categorys extends StatefulWidget {
  const Categorys({super.key});

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.statusBarColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.tcbot,
              width: size.width / 3,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(MyStrings.successfulRegistration),
            Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 28),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: MyStrings.nameAndFamilyName,
                      hintStyle: textthem.labelSmall),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 18),
              child: const Text(MyStrings.chooseCats),
            ),

            //Maintagslist
            SizedBox( 
              width: double.infinity,
              height: size.height / 8,
              child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.4,
                  ),
                  itemBuilder: (context, index) => InkWell(
                      onTap: () => setState(() {
                            if (!selectedTags.contains(tagList[index])) {
                              selectedTags.add(tagList[index]);
                            } else {
                              print("object");
                            }
                          }),
                      child: MainTags(textthem: textthem, index: index))),
            ),
            const SizedBox(
              height: 18,
            ),
            Assets.icons.downCatArrow.image(scale: 2),
            //selectedtags
            SizedBox(
              width: double.infinity,
              height: size.height / 8,
              child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedTags.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.3,
                  ),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: SolidColors.surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedTags[index].title,
                                style: textthem.bodyMedium,
                              ),
                              InkWell(
                                  onTap: () => setState(() {
                                        selectedTags.removeAt(index);
                                      }),
                                  child: Icon(CupertinoIcons.delete)),
                            ],
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
