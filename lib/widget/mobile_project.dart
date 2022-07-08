import 'package:flutter/material.dart';

import 'custome_text.dart';

class FeatureProjectMobile extends StatelessWidget {
  final String? imagePath;
  final String? projectTitle;
  final String? projectDesc;
  final String? tech1;
  final String? tech2;
  final String? tech3;
  final Function? ontab;

  FeatureProjectMobile(
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
      width: size.width,
      //color: Colors.tealAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            height: size.height * 0.10,
            width: size.width * 0.5,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                CustomText(
                  text: projectTitle!,
                  textsize: 18,
                  color: Color(0xffD3F3FF),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.75,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * 0.25,
            width: size.width,
            //color: Colors.redAccent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(imagePath!),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.center,
            height: size.height * 0.1,
            width: size.width,
            decoration: BoxDecoration(
              color: Color(0xff172A45),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomText(
                    text: projectDesc!,
                    textsize: 12.0,
                    color: Colors.white.withOpacity(0.4),
                    letterSpacing: 0.35,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
