import 'package:flutter/material.dart';
import 'package:insure/models/onboard_content.dart';
import 'package:insure/screens/account/login.dart';
import 'package:insure/utils/size_config.dart';
import 'package:insure/widgets/terms.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          const SizedBox(
            height: 85,
          ),
          Expanded(
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: contents.length,
                onPageChanged: (value) => setState(() => currentPage = value),
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image(
                            image: AssetImage(
                              contents[i].image,
                              // height: SizeConfig.blockV! * 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (height >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize: (width <= 550) ? 30 : 35),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w300,
                            fontSize: (width <= 550) ? 17 : 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (index) => buildDots(index: index),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          currentPage + 1 == contents.length
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Agree(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          padding: (width <= 550)
                              ? const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20)
                              : EdgeInsets.symmetric(
                                  horizontal: width * 0.2, vertical: 25),
                          textStyle: TextStyle(fontSize: (width <= 550) ? 13 : 17),
                        ),
                        child: const Text(
                          "START",
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        style: TextButton.styleFrom(
                            elevation: 0,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: (width <= 550) ? 13 : 17,
                            )),
                        child: const Text(
                          "SKIP",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 0,
                            padding: (width <= 550)
                                ? const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20)
                                : const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 25),
                            textStyle:
                                TextStyle(fontSize: (width <= 550) ? 13 : 17)),
                        child: const Text("NEXT"),
                      )
                    ],
                  ),
                )
        ],
      ),

      // const SizedBox(height: 50,),
      // Expanded(
      //   child: PageView.builder(
      //       physics: const BouncingScrollPhysics(),
      //       controller: controller,
      //       itemCount: contents.length,
      //       onPageChanged: (value) => setState(() => currentPage = value),
      //       itemBuilder: (_, i) {
      //         return Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Column(
      //             children: [
      //               Image.asset(
      //                 contents[i].image,
      //                 height: SizeConfig.blockV! * 35,
      //               ),
      //               SizedBox(
      //                 height: (height >= 840) ? 60 : 30,
      //               ),
      //               Text(
      //                 contents[i].title,
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                     fontFamily: "Mulish",
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: (width <= 550) ? 30 : 35),
      //               ),
      //               const SizedBox(
      //                 height: 15,
      //               ),
      //               Text(
      //                 contents[i].desc,
      //                 style: TextStyle(
      //                   fontFamily: "Mulish",
      //                   fontWeight: FontWeight.w300,
      //                   fontSize: (width <= 550) ? 17 : 25,
      //                 ),
      //                 textAlign: TextAlign.center,
      //               )
      //             ],
      //           ),
      //         );
      //       }),
      // ),
      // Expanded(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: List.generate(
      //           contents.length,
      //           (index) => buildDots(index: index),
      //         ),
      //
    );
  }

  AnimatedContainer buildDots({int? index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(left: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentPage == index ? 20 : 10,
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Color(0xFF000000),
      ),
    );
  }
}
