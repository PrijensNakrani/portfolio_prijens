import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_demo/constant/constant.dart';

class CarouselSliderWidgetTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: size.width * 0.3,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.5,
      ),
      itemCount: projectImage.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(projectImage[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
