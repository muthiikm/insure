
class Slide {
  final String imageURl;
  final String title;
  final String desc;

  Slide({required this.imageURl, required this.title, required this.desc});
}

final slideList = [
  Slide(imageURl: "img/welcome-one.png", title: "welcome one", desc: "insure"),
  Slide(imageURl: "img/welcome-two.png", title: "title", desc: "welocme two"),
  Slide(imageURl: "img/welcome-three.png", title: "title", desc: "welcome 3")
];
