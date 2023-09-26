import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WelcomeSlider extends StatefulWidget {
  const WelcomeSlider({super.key});

  @override
  State<WelcomeSlider> createState() => _WelcomeSliderState();
}

class _WelcomeSliderState extends State<WelcomeSlider> {
  int current = 0;
  final List imgList = [
    'img/insure1.jpg',
    'img/insure2.jpg',
    'img/insure3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 85,),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
          items: imgList
              .map((item) => Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                            height: 160,
                            width: 400,
                          ),
                        )),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((item) {
            int index = imgList.indexOf(item);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
