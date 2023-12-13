import 'package:flutter/material.dart';
import 'package:mobile_app/utils/dimensions.dart';
import 'package:mobile_app/widgets/big_text.dart';
import 'package:mobile_app/widgets/icon_n_text.dart';
import 'package:mobile_app/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BigText(text: text, size: Dimensions.height20,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: Color(0xFF89dad0),
                          size: 15,
                        ))),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "4.7"),
            SizedBox(
              width: Dimensions.width20,
            ),
            SmallText(text: "1008"),
            SizedBox(
              width: Dimensions.width20,
            ),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconAndText(
                icon: Icons.circle_sharp,
                text: "Regular",
                iconColor: Color(0xFFffd28d)),
                SizedBox(
              width: Dimensions.width20,
            ),
            IconAndText(
                icon: Icons.location_on,
                text: "1.3k",
                iconColor: Color(0xFF89dad0)),
                SizedBox(
              width: Dimensions.width20,
            ),
            IconAndText(
                icon: Icons.access_time_rounded,
                text: "30mins",
                iconColor: Color(0xFFfcab88)),
          ],
        ),
      ],
    );
  }
}
