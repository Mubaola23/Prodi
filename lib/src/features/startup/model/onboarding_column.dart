import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/spacing.dart';

class OnboardingColumn extends StatelessWidget {
  final String? imgPath;
  final String? titletext;

  const OnboardingColumn({
    this.imgPath,
    this.titletext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: responsive50(context)),
        SvgPicture.asset(
          imgPath!,
          width: MediaQuery.of(context).size.height / 3,
        ),
        const Spacer(),
        Text(titletext!),
        SizedBox(height: responsive20(context)),
      ],
    );
  }
}
