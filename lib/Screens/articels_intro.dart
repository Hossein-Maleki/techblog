import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';

class ArticelsIntro extends StatelessWidget {
  const ArticelsIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            Assets.images.tcbot,
            width: 164,
          ),
          SizedBox(
            height: 20,
          ),
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(text: Text(MyStrings.welcom).data)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(size.width / 3, 12, size.width / 3, 12),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  
                      (SolidColors.primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: Text(
                  MyStrings.letsGo,
                  style: textthem.headlineSmall,
                )),
          )
        ],
      ),
    ));
  }
}
