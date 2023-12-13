import 'package:flutter/material.dart';
import 'package:mobile_app/utils/colours.dart';
import 'package:mobile_app/utils/dimensions.dart';
import 'package:mobile_app/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  double textHeight = Dimensions.scrnHeight / 6.91;

  bool get isTextLong => widget.text.length > textHeight;

  late String firstHalf;
  late String secondHalf;
  bool isShowingMore = false;

  @override
  void initState() {
    super.initState();
    updateText();
  }

  void onShowMoreTap() {
    setState(() {
      isShowingMore = !isShowingMore;
    });
  }

  void updateText() {
    if (isTextLong) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              children: [
                Text(
                  // firstHalf + (isTextLong ? '...' : (firstHalf + secondHalf)),
                  isShowingMore ? widget.text :firstHalf + (isTextLong? "..." : ""),
                  style: TextStyle(
                    color: AppColors.paraColor,
                    fontSize: Dimensions.font16,
                    height: 1.5,
                  ),
                ),
                GestureDetector(
                  onTap:  onShowMoreTap,
                  child: Row(
                    children: [
                      SmallText(text: "Show more", color: AppColors.mainColor,height: 1.5,),
                      Icon(
                        isTextLong
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
