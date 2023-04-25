class Onboard {
  String image;
  String titleButton;
  String title;
  String skip;
  Onboard(
      {required this.image,
      required this.titleButton,
      required this.skip,
      required this.title});
}

List<Onboard> mlistOnboard = [
  Onboard(
      image: "images/onboard1.png",
      title: "Khám phá \n thư viện sách nói",
      skip: "Bỏ qua bước này",
      titleButton: 'TIẾP TỤC'),
  Onboard(
      image: "images/onboard2.png",
      title: "Đa dạng chủ đề \n muôn vàn tri thức",
      skip: "Bỏ qua bước này",
      titleButton: 'TIẾP TỤC'),
  Onboard(
      image: "images/onboard3.png",
      title: "Hàng ngàn cuốn sách \n trong tầm tay",
      skip: "Bỏ qua bước này",
      titleButton: 'BẮT ĐẦU NGAY'),
];
