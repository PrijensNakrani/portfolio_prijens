import 'package:flutter/material.dart';
import 'package:portfolio_demo/widget/glass_box.dart';

import 'custome_text.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "About Me",
                      textsize: 30.0,
                      color: Color(0xff59bd99),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Wrap(
                  children: [
                    CustomText(
                      text: "Hello! I'm Prijens Nakrani,\nFrom Gujarat IN.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "Shortly currently, I am purshuing my Bachlor's degree in Computer science and Engineering, as well as im improving myself and gain new knowledge ,i build neat, cool and scalable mobile app and webapp with flutter.\n\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                    CustomText(
                      text:
                          "Here are a few technologies I've been working with recently:\n\n",
                      textsize: 16.0,
                      color: const Color(0xff828DAA),
                      // fontWeight: FontWeight.w500,
                      letterSpacing: 0.75,
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  child: Wrap(
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "Firebase"),
                            technology(context, "UI/UX"),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            technology(context, "C/C++"),
                            technology(context, "Git "),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Profile Image
          Container(
            height: size.height / 1.5,
            width: size.width / 2 - 100,
            // color: Colors.white,
            child: const GlassBox(),
          ),
        ],
      ),
    );
  }
}

Widget technology(BuildContext context, String text) {
  return Row(
    children: [
      Icon(
        Icons.check_circle,
        color: Color(0xff64FFDA).withOpacity(0.6),
        size: 10.0,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.01,
      ),
      Text(
        text,
        style: TextStyle(
          color: Color(0xff717C99),
          letterSpacing: 1.75,
        ),
      )
    ],
  );
}
