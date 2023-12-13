import 'package:flutter/material.dart';
import 'package:mobile_app/drinks_app_body.dart';
import 'package:mobile_app/utils/dimensions.dart';
import 'package:mobile_app/widgets/big_text.dart';
import 'package:mobile_app/widgets/small_text.dart';
import 'colours.dart';

class MainDrinkPage extends StatefulWidget {
  const MainDrinkPage({super.key});

  @override
  State<MainDrinkPage> createState() => _MainDrinkPageState();
}

class _MainDrinkPageState extends State<MainDrinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.white,
        body: Column(
              children: [
        Container(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Ghana", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "Accra", color: Colors.black54, ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white, size: Dimensions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ),
        ),      
        Expanded(
          child:DrinksPageBody()),
        // DrinksPageBody()
        ],
            ),           
            );
  }
}
