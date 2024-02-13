import 'package:flutter/material.dart';
import '../../../../core/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.fromLTRB(0, 5, 0, 5),
        width: MediaQuery.of(context).size.width *0.85/ 1.8,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          
          color: kAquarop,
          border: const Border(
            top: BorderSide(color: kWhiteColor, width: 1),
            bottom: BorderSide(color: kWhiteColor, width: 1),
            right: BorderSide(color: kWhiteColor, width: 1),
            left: BorderSide(color: kWhiteColor, width: 1),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}