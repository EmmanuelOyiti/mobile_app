import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/colours.dart';
import 'package:mobile_app/utils/dimensions.dart';
import 'package:mobile_app/widgets/big_text.dart';
import 'package:mobile_app/widgets/icon_n_text.dart';
import 'package:mobile_app/widgets/small_text.dart';

class DrinksPageBody extends StatefulWidget {
  const DrinksPageBody({super.key});

  @override
  State<DrinksPageBody> createState() => _DrinksPageBodyState();
}

class _DrinksPageBodyState extends State<DrinksPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageVal = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageVal = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:  Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
         new DotsIndicator(
            dotsCount: 5,
            position: _curPageVal,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeColor: AppColors.mainColor,
            ),
          )
      ],
    );
  }
    

    Widget _buildPageItem(int index) {
      var matrix = new Matrix4.identity();
    if (index == _curPageVal.floor()) {
      var curScale = 1 - (_curPageVal - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _curPageVal.floor() + 1) {
      var curScale =
          _scaleFactor + (_curPageVal - index + 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _curPageVal.floor() - 1) {
      var curScale = 1 - (_curPageVal - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2; 
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

      return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food0.png"))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height:  Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    )
                  ]
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Our Drink"),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 15,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "1008"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "Comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconAndText(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: AppColors.iconColor1),
                          IconAndText(
                              icon: Icons.location_on,
                              text: "1.7",
                              iconColor: AppColors.mainColor),
                          IconAndText(
                              icon: Icons.access_time_filled_rounded,
                              text: "32mins",
                              iconColor: AppColors.iconColor2),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

