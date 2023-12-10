import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_app/drinks_app_body.dart';
import 'package:mobile_app/pages/drinks_app_body.dart';
import 'package:mobile_app/utils/dimensions.dart';
import 'package:mobile_app/widgets/app_column.dart';
import 'package:mobile_app/widgets/app_icon.dart';
import 'package:mobile_app/widgets/big_text.dart';
import 'package:mobile_app/widgets/expanding_text.dart';
import 'package:mobile_app/widgets/small_text.dart';
import 'package:mobile_app/utils/colours.dart';

import '../../widgets/icon_n_text.dart';

class PopularFoodInfo extends StatelessWidget {
  const PopularFoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var mainColor;
    var iconColor1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image

          Positioned(
            left: 0,
            right: 0,
            top: 0, // Adjusted to the top
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),

          // Icon Widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => DrinksPageBody());
                    },
                    child: AppIcon(icon: Icons.arrow_back)),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
          ),

          // Intro On Food
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize - 20, // Adjusted for overlap
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "Castle Bridge",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: "Introduce"),
                  //Expanding Text Widget
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  SizedBox(
                    height: Dimensions.listViewTextContSize,
                    child: SingleChildScrollView(
                      child: ExpandableText(
                          text:
                              "GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2]"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeight,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            right: Dimensions.width20,
            left: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              child: BigText(
                text: "Ghc 0.00 Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
