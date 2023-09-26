import 'package:flutter/material.dart';

Widget company(
  String make,
  String model,
  String imageurl,
  String premium,
  String covertype,
  Function()? view,
  Function()? buy,
) {
  TextStyle span = const TextStyle(fontSize: 18, color: Colors.red);
  return GestureDetector(
    // onTap: ontap,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 6, bottom: 6, top: 6,),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 130,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                          // color: Color(0xffDDDDDD),
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0))
                    ]),
                // child: Icon(
                //   icon,
                //   size: 28,
                //   color: color,
                // ),
                child: Image(
                  height: 40,
                  width: 55,
                  image: AssetImage(imageurl),
                ),
              ),
              // const SizedBox(
              //   width: 7,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 20, right: 0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: span,
                      children: [
                        TextSpan(text: make),
                        TextSpan(text: model)
                    ])),
                    Text(
                      "premium: $premium",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      covertype,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                              height: 30,
                              width: 70,
                              child: ElevatedButton(
                                onPressed: view, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent
                                ),
                                child: const Text("view",))),
                        const SizedBox(width: 12,),
                        SizedBox(
                              height: 30,
                              width: 60,
                              child: ElevatedButton(
                                onPressed: buy, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent
                                ),
                                child: const Text("buy"))),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       height: 30,
                    //       width: 30,
                    //       child: ElevatedButton(onPressed: buy, child: const Text("buy"))),
                    //     const Spacer(),
                    //     SizedBox(
                    //       height: 30,
                    //       width: 30,
                    //       child: ElevatedButton(onPressed: save, child: const Text("save quote")))
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    ),
  );
}
