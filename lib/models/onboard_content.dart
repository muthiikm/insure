class OnboardContent {
  final String title;
  final String image;
  final String desc;

  OnboardContent(
      {required this.title, required this.image, required this.desc});
}

List<OnboardContent> contents = [
  OnboardContent(
      title: "Get a variety of covers.",
      image: "img/insure1.jpg",
      desc: "At Bima App, you can get all your insurance services under one place."),
  OnboardContent(
      title: "Get quotes that favour you best",
      image: "img/insure2.jpg",
      desc:
          "We ensure that the quote you get suits your needs and your budget"),
  OnboardContent(
      title: "Get Insured on the Go",
      image: "img/insure3.jpg",
      desc:
          "Get insured from any place at anytime within moments of application")
];
