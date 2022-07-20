import 'package:flutter/material.dart';
import 'package:prodi/src/core/constants/app_textstyles.dart';
import 'package:prodi/src/core/constants/colors.dart';
import 'package:prodi/src/core/constants/dimensions.dart';

class ProductTag extends StatelessWidget {
  final String text;
  final String headText;
  final void Function() onPressed;

  const ProductTag(
      {Key? key,
      required this.headText,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: Dimensions.medium,
              ),
              Text(
                headText,
                style: bodyText1(context).copyWith(
                  fontSize: 16.0,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
