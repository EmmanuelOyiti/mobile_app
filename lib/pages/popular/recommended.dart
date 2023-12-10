import 'package:flutter/material.dart';
import 'package:mobile_app/utils/colours.dart';
import 'package:mobile_app/utils/dimensions.dart';
import 'package:mobile_app/widgets/app_icon.dart';
import 'package:mobile_app/widgets/big_text.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                color: Colors.white,
                child: Center(
                    child: BigText(
                        size: Dimensions.font26, text: "Castle Bridge")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
                "GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2],GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2]GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2],GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2],GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2]GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2],GIHOC Distilleries Company Limited was first modern distillery company, to be established in West Africa. It was established by the pre-independence Industrial Development Corporation (IDC) in 1958 as the State Distilleries Corporation for the manufacture of alcoholic beverages. The managing director of GIHOC Distilleries Company Limited is Maxwell Kofi Jumah.[1][2]"),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    icon: Icons.remove),

                    BigText(text: "\Ghc10.00 "+" X "+" 0", color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
              child:Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              )
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
    
        ],
      ),
    );
  }
}
