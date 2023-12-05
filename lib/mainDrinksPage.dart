import 'package:flutter/material.dart';
import 'package:mobile_app/drinks_app_body.dart';
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
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 35, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
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
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ),
        ),      
        DrinksPageBody(),
        ],
    ));
  }
}
