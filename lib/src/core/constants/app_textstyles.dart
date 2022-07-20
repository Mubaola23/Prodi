import 'package:flutter/material.dart';

import '../../widgets/spacing.dart';
import 'colors.dart';

/// App TextStyles

TextStyle heading1(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: responsive50(context),
      fontWeight: FontWeight.w600,
    );

TextStyle heading2(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: responsive24(context),
      fontWeight: FontWeight.w600,
    );

// TextStyle heading3(BuildContext context) => TextStyle(

//       color: AppColors.dark,
//       fontSize: Responsive.isMobile(context) ? responsive26(context) : 36,
//       fontWeight: FontWeight.w400,
//     );

TextStyle heading4(BuildContext context) => TextStyle(
      fontSize: responsive18(context),
      fontWeight: FontWeight.w400,
    );

TextStyle bodyText1(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: responsive12(context),
      fontWeight: FontWeight.w400,
    );

TextStyle bodyText2(BuildContext context) => TextStyle(
      color: AppColors.dark,
      fontSize: responsive10(context),
      fontWeight: FontWeight.w300,
    );
