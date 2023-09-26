import 'package:flutter/material.dart';
import 'package:insure/models/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(slideList[index].imageURl),
              fit: BoxFit.cover
              )
          ),
        ), 
        const SizedBox(height: 5,),
        Text(slideList[index].title),
        const SizedBox(height: 4,),
        Text(slideList[index].desc, textAlign: TextAlign.center,)
      ],
    );
  }
}
