import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final controller = CarouselSliderController();
  int activeIndex = 0;

  final List<String> imageUrls = List.generate(
    5,
    (_) =>
        "https://images.pexels.com/photos/97050/pexels-photo-97050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: imageUrls.length,
          options: CarouselOptions(
            height: 220,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final imageUrl = imageUrls[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
        ),
        Positioned(
          bottom: 12,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imageUrls.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.white,
              dotColor: Colors.white54,
            ),
          ),
        ),
      ],
    );
  }
}
