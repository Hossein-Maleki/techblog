import 'package:flutter/material.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/gen/assets.gen.dart';

class SingelArticels extends StatelessWidget {
  const SingelArticels({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(Assets.images.singlePlaceHolder.path),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: GradientColors.singleAppbarGradiant),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_rounded,
                              color: SolidColors.lightIcon, size: 28),
                          Expanded(
                              child: SizedBox(
                            width: 5,
                          )),
                          Icon(
                            Icons.bookmark_add_outlined,
                            color: SolidColors.lightIcon,
                            size: 24,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.share_rounded,
                              color: SolidColors.lightIcon, size: 24),
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
