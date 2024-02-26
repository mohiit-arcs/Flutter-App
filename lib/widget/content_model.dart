class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      image: "images/screen1.png",
      title: 'Select from Our\n     Best Menu',
      description: 'Pick your food from our Menu\n       More than 35 times'),
  OnBoardingContent(
      image: "images/screen2.png",
      title: 'Easy and Online Payment',
      description:
          'You can pay Cash On Delivery\n and Card Payment is also available'),
  OnBoardingContent(
      image: "images/screen3.png",
      title: 'Quick Delivery at your Doorstep',
      description: 'Deliver your food at \n     your Doorstep'),
];
