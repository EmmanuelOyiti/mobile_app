// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_app/controllers/popular_prod_controllers.dart';
// import 'package:mobile_app/controllers/recommended-product_controller.dart';
// import 'package:mobile_app/mainDrinksPage.dart';
// import 'package:mobile_app/pages/popular/popularDrinksInfo.dart';
// import 'package:mobile_app/utils/appConstants.dart';
// import 'package:mobile_app/utils/colours.dart';
// import 'package:mobile_app/utils/dimensions.dart';
// import 'package:mobile_app/widgets/app_column.dart';
// import 'package:mobile_app/widgets/big_text.dart';
// import 'package:mobile_app/widgets/icon_n_text.dart';
// import 'package:mobile_app/widgets/small_text.dart';

// class DrinksPageBody extends StatefulWidget {
//   const DrinksPageBody({super.key});

//   @override
//   State<DrinksPageBody> createState() => _DrinksPageBodyState();
// }

// class _DrinksPageBodyState extends State<DrinksPageBody> {
//   PageController pageController = PageController(viewportFraction: 0.85);
//   var _curPageVal = 0.0;
//   double _scaleFactor = 0.8;
//   double _height = Dimensions.pageViewContainer;
//   @override
//   void initState() {
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         _curPageVal = pageController.page!;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         GetBuilder<PopularProductController>(builder: (popularProducts) {
//           return popularProducts.isLoaded
//               ? Container(
//                   height: Dimensions.pageView,
//                   child: GestureDetector(
//                     onTap: (){
//                        Get.to(() => PopularFoodInfo());
//                     },
//                     child: PageView.builder(
//                         controller: pageController,
//                         itemCount: popularProducts.popularProductList.isEmpty
//                             ? 1
//                             : popularProducts.popularProductList.length,
//                         itemBuilder: (context, position) {
//                           return _buildPageItem(position,
//                               popularProducts.popularProductList[position]);
//                         }),
//                   ),
//                 )
//               : CircularProgressIndicator(
//                   color: AppColors.mainColor,
//                 );
//         }),

//         GetBuilder<PopularProductController>(builder: (popularProducts) {
//           return DotsIndicator(
//             dotsCount: popularProducts.popularProductList.length,
//             position: _curPageVal,
//             decorator: DotsDecorator(
//               size: const Size.square(9.0),
//               activeSize: const Size(18.0, 9.0),
//               activeShape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               activeColor: AppColors.mainColor,
//             ),
//           );
//         }),
// //Popular Text
//         SizedBox(
//           height: Dimensions.height30,
//         ),
//         Container(
//           margin: EdgeInsets.only(left: Dimensions.width30),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               BigText(text: "Recommended"),
//               SizedBox(
//                 width: Dimensions.width10,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 3),
//                 child: BigText(
//                   text: ".",
//                   color: Colors.black26,
//                 ),
//               ),
//               SizedBox(
//                 width: Dimensions.width10,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 2),
//                 child: SmallText(text: "Customer Favourites "),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: Dimensions.height20,
//         ),
//         //Drinks with images list
//         GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
//           return recommendedProduct.isLoaded
//               ? ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   // shrinkWrap: true,
//                   itemCount: recommendedProduct.recommendedProductList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.only(
//                         left: Dimensions.width20,
//                         right: Dimensions.width20,
//                         bottom: Dimensions.height10,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 120,
//                             height: 120,
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(Dimensions.radius20),
//                               color: Colors.white,
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!),),
//                             ),
//                           ),
//                           //text container
//                           Expanded(
//                             child: Container(
//                               width: Dimensions.listViewImgSize,
//                               height: Dimensions.listViewTextContSize,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topRight:
//                                       Radius.circular(Dimensions.radius20),
//                                   bottomRight:
//                                       Radius.circular(Dimensions.radius20),
//                                 ),
//                                 color: Colors.white,
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                     left: Dimensions.width10,
//                                     right: Dimensions.width10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     BigText(
//                                         text:
//                                             recommendedProduct.recommendedProductList[index].name),
//                                     SizedBox(
//                                       height: Dimensions.height10,
//                                     ),
//                                     SmallText(text: "Made from the finest "),
//                                     SizedBox(
//                                       height: Dimensions.height10,
//                                     ),
//                                     Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         IconAndText(
//                                             icon: Icons.circle_sharp,
//                                             text: "Regular",
//                                             iconColor: AppColors.iconColor1),
//                                         IconAndText(
//                                             icon: Icons.location_on,
//                                             text: "1.3k",
//                                             iconColor: AppColors.mainColor),
//                                         IconAndText(
//                                             icon: Icons.access_time_rounded,
//                                             text: "30mins",
//                                             iconColor: AppColors.iconColor2),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   })
//               : CircularProgressIndicator(
//                   color: AppColors.mainColor,
//                 );
//         })
//       ],
//     );
//   }

//   Widget _buildPageItem(int index, popularProduct) {
//     Matrix4 matrix = new Matrix4.identity();
//     if (index == _curPageVal.floor()) {
//       var curScale = 1 - (_curPageVal - index) * (1 - _scaleFactor);
//       var curTrans = _height * (1 - curScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, curScale, 1)
//         ..setTranslationRaw(0, curTrans, 0);
//     } else if (index == _curPageVal.floor() + 1) {
//       var curScale =
//           _scaleFactor + (_curPageVal - index + 1) * (1 - _scaleFactor);
//       var curTrans = _height * (1 - curScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, curScale, 1);
//       matrix = Matrix4.diagonal3Values(1, curScale, 1)
//         ..setTranslationRaw(0, curTrans, 0);
//     } else if (index == _curPageVal.floor() - 1) {
//       var curScale = 1 - (_curPageVal - index) * (1 - _scaleFactor);
//       var curTrans = _height * (1 - curScale) / 2; // Added curTrans
//       matrix = Matrix4.diagonal3Values(1, curScale, 1)
//         ..setTranslationRaw(0, curTrans, 0);
//     } else {
//       var curScale = 0.8;
//       matrix = Matrix4.diagonal3Values(1, curScale, 1)
//         ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
//     }

//     return Transform(
//       transform: matrix,
//       child: Stack(
//         children: [
//           Container(
//             height: Dimensions.pageViewContainer,
//             margin: EdgeInsets.only(
//                 left: Dimensions.width10, right: Dimensions.width10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.radius30),
//                 color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(AppConstants.BASE_URL +
//                         AppConstants.UPLOAD_URL +
//                         popularProduct.img!))),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: Dimensions.pageViewTextContainer,
//               margin: EdgeInsets.only(
//                   left: Dimensions.margin30,
//                   right: Dimensions.margin30,
//                   bottom: Dimensions.margin30),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Color(0xFFe8e8e8),
//                         blurRadius: 5.0,
//                         offset: Offset(0, 5)),
//                     BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
//                     BoxShadow(color: Colors.white, offset: Offset(5, 0))
//                   ]),
//               child: Container(
//                   padding: EdgeInsets.only(
//                       top: Dimensions.height15, left: 15, right: 15),
//                   child: AppColumn(
//                     text: popularProduct.name!,
//                   )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
