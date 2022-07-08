import 'package:flutter/material.dart';

import 'custome_text.dart';

class FeatureProject extends StatelessWidget {
  final String? imagePath;
  final String? projectTitle;
  final String? projectDesc;
  final String? tech1;
  final String? tech2;
  final String? tech3;
  final Function? ontab;

  FeatureProject(
      {this.imagePath,
      this.ontab,
      this.projectDesc,
      this.projectTitle,
      this.tech1,
      this.tech2,
      this.tech3});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 0.999,
      width: size.width - 100,
      //color: Colors.tealAccent,
      child: Column(
        children: [
          Container(
            height: size.height - 100,
            width: size.width - 84,
            child: Stack(
              children: [
                //Image
                Positioned(
                  top: size.height * 0.02,
                  left: 20.0,
                  child: Container(
                    height: size.width * 0.3,
                    width: size.width * 0.55,
                    //color: Colors.redAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(imagePath!),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 6,
                  right: 10.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.18,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      color: Color(0xff172A45),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomText(
                            text: projectDesc!,
                            textsize: 16.0,
                            color: Colors.white.withOpacity(0.4),
                            letterSpacing: 0.75,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.10,
                    width: size.width * 0.25,
                    //color: Colors.indigo,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        CustomText(
                          text: projectTitle!,
                          textsize: 27,
                          color: Color(0xffD3F3FF),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.36,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.25,
                    // color: Colors.indigo,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: tech1 == null ? "" : tech1!,
                          textsize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.75,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        CustomText(
                          text: tech2 == null ? "" : tech2!,
                          textsize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.75,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        CustomText(
                          text: tech3 == null ? "" : tech3!,
                          textsize: 14,
                          color: Colors.grey,
                          letterSpacing: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
