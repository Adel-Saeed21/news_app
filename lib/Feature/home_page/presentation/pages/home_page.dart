import 'package:flutter/material.dart';
import 'package:newsapp/Feature/home_page/presentation/widgets/category_tab_bar.dart';
import 'package:newsapp/Feature/home_page/presentation/widgets/image_carousel.dart';
import 'package:newsapp/core/helpers/space.dart';
import 'package:newsapp/core/themes/app_colors.dart';
import 'package:newsapp/core/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              _userHeader(),
              verticalSpace(10),
              ImageCarousel(),
              verticalSpace(10),

              CategoryTabBar(
                categories: const [
                  "Science",
                  "Environment",
                  "Animals",
                  "Travel",
                ],
                onTabSelected: (index) {
                  debugPrint("Selected tab index: $index");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Anderson", style: AppTextStyles.font18SemiBoldWhite),
            Text("Have a nice day", style: AppTextStyles.font14RegularGray),
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.appbarWhiteColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/user.png",
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
