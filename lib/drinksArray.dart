import 'package:flutter/material.dart';
import 'package:mobile_app/colours.dart';
import 'package:mobile_app/widgets/big_text.dart';
import 'package:mobile_app/widgets/icon_n_text.dart';
import 'package:mobile_app/widgets/small_text.dart';

import 'utils/dimensions.dart';

class DrinksArray extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String iconText;
  final String locationText;
  final String timeText;

   DrinksArray({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.iconText,
    required this.locationText,
    required this.timeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        bottom: Dimensions.height10,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.listViewImgSize,
            height: Dimensions.listViewTextContSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white38,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: Dimensions.listViewTextContSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  bottomRight: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BigText(text: title),
                    SizedBox(height: Dimensions.height10),
                    SmallText(text: description),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndText(
                          icon: Icons.circle_sharp,
                          text: iconText,
                          iconColor: AppColors.iconColor1,
                        ),
                        IconAndText(
                          icon: Icons.location_on,
                          text: locationText,
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndText(
                          icon: Icons.access_time_filled_rounded,
                          text: timeText,
                          iconColor: AppColors.iconColor2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  final List<Map<String, dynamic>> drinksData = [
    {
      'image': 'assets/image/food0.png',
      'title': 'Sparkling Drink From Ghana',
      'description': 'With a Ghanaian taste',
      'details': {
        'type': 'Normal',
        'location': '1.7',
        'time': '32mins',
      },
    },
    // Add more items as needed
  ];

 DrinksArray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 900,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drinksData.length,
              itemBuilder: (context, index) {
                final drink = drinksData[index];
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(drink['image']),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BigText(text: drink['title']),
                                SizedBox(height: Dimensions.height10),
                                SmallText(text: drink['description']),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndText(
                                      icon: Icons.circle_sharp,
                                      text: drink['details']['type'],
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconAndText(
                                      icon: Icons.location_on,
                                      text: drink['details']['location'],
                                      iconColor: AppColors.mainColor,
                                    ),
                                    IconAndText(
                                      icon: Icons.access_time_filled_rounded,
                                      text: drink['details']['time'],
                                      iconColor: AppColors.iconColor2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

