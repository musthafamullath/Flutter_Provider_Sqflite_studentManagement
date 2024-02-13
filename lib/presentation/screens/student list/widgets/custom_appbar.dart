import 'package:flutter/material.dart';
import '../../../../core/assets.dart';
import '../../../../core/colors.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_search_field.dart';
import '../../../widgets/heading.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlue,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          0,
          10,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: 18,
                    child: Image.asset(
                      leftArrowIcon,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                kWidth(MediaQuery.of(context).size.width * 0.05),
                const HeadingWidget(
                  text: "List Of Students",
                  textColor: kWhiteColor,
                ),
              ],
            ),
            kHeight(MediaQuery.of(context).size.height * 0.03),
            CustomSearchFieldWidget(),
          ],
        ),
      ),
    );
  }
}