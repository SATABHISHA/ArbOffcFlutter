
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  static String id = 'UserHome';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
    'images/image10.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Wrkplan"),
    ),
    /*body: Swiper(
    itemBuilder: (context, index) {
    return Image.asset(
    images[index],
    fit: BoxFit.contain,
    );
    },
    indicatorLayout: PageIndicatorLayout.COLOR,
    autoplay: true,
    itemCount: images.length,
    pagination: const SwiperPagination(),
    control: const SwiperControl(),
    )*/

      body: Column(
        children: [
          Expanded(
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                );
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              // autoplay: true,
              itemCount: images.length,
              pagination: SwiperPagination(
                builder: SwiperPagination.rect,
              ),
              control: SwiperControl(),

            ),
          ),
          SizedBox(height: 10), // Add some space between the swiper and thumbnails
          Container(
            height: 60, // Height of the thumbnail images
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // When a thumbnail is tapped, navigate to the corresponding slide
                    setState(() {
                      // Jump to the selected index
                      SwiperController().move(index);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      images[index],
                      width: 100, // Width of the thumbnail images
                      height: 60, // Height of the thumbnail images
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),


    );


  }
}
