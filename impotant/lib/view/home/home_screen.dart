import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:impotant/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerHome(),
                  saleImage(),
                  listProduct(),
                  listCategory(),
                  listProduct(),
                  imageSale(
                      image: "asset/img/png.png",
                      textOn: "Recomended \nProduct",
                      textBelow: "We recommend the best for you"),
                  girdviewProduct(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget headerHome() {
  return Row(
    children: [
      SizedBox(
        width: 280,
        height: 40,
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 17,
              ),
              hintText: 'Search Product',
              hintStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      SvgPicture.asset("asset/icons/love.svg"),
      const SizedBox(
        width: 20,
      ),
      SvgPicture.asset("asset/icons/bell.svg"),
    ],
  );
}

Widget saleImage() {
  return Column(
    children: [
      SizedBox(
        //height: 260,
        width: Get.size.height * 1,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) => imageSale(
                image: "asset/img/png.png",
                textOn: "\nSuper Flash Sale\n50% Off",
                textBelow: "",
                dateTime: dateTime()),
            options: CarouselOptions(
              height: 260,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reson) {
                controller.currentIndex = index;
                controller.update();
              },
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => AnimatedSmoothIndicator(
                activeIndex: controller.currentIndex,
                count: 5,
                effect: const JumpingDotEffect(dotWidth: 10, dotHeight: 10),
              )),
    ],
  );
}

Widget product({Widget? rate}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.black12, width: 1),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 109,
            height: 109,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/img/image.png"),
              ),
            ),
          ),
          const Text(
            "FS - Nike Air Max 270 React...",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          rate ?? const Text(""),
          const SizedBox(
            height: 10,
          ),
          const Text("\$299,43",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Text("\$534,33",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              SizedBox(
                width: 10,
              ),
              Text("24% Off",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget listProduct() {
  return SizedBox(
      height: 238,
      child: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          width: 141,
          height: 238,
          child: product(rate: rate()),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 7,
        scrollDirection: Axis.horizontal,
      ));
}

Widget category() {
  return const SizedBox(
      child: CircleAvatar(
    radius: 30,
    backgroundColor: Colors.black12,
    child: CircleAvatar(
      radius: 29,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/fir-grocery-e8040.appspot.com/o/shirt.png?alt=media&token=d9feee09-f3d0-4025-a797-63bc93e735f2",
        ),
      ),
    ),
  ));
}

Widget listCategory() {
  return SizedBox(
    height: 70,
    child: ListView.separated(
      itemBuilder: (context, index) => category(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: 9,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget imageSale(
    {required String image,
    required String textOn,
    required String textBelow,
    Widget? dateTime}) {
  return GestureDetector(
    child: Container(
      width: 343,
      height: 206,
      margin: const EdgeInsets.only(left: 1, right: 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textOn,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 40,
            ),
            dateTime ?? const Text(""),
            Text(
              textBelow,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    ),
    onTap: () {},
  );
}

Widget girdviewProduct() {
  return Flexible(
    fit: FlexFit.loose,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 0.75,
          mainAxisSpacing: 15),
      itemBuilder: (context, index) => SizedBox(
        child: product(),
      ),
      itemCount: 6,
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
    ),
  );
}

Widget dateTime() {
  return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Row(
            children: [
              SizedBox(
                width: 42,
                height: 41,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(controller.hour),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 42,
                height: 41,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(controller.minute),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 42,
                height: 41,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(controller.second),
                  ),
                ),
              ),
            ],
          ));
}

Widget rate() {
  return GetBuilder<HomeController>(
    init: HomeController(),
    builder: (controller) => RatingBar.builder(
        ignoreGestures: true,
        initialRating: 3,
        itemSize: 20,
        minRating: 1,
        itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (rating) {
          controller.rating = rating;
        }),
  );
}
