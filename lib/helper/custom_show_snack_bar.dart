import 'package:flutter/material.dart';

import '../constant/my_colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: MyColors.unActiveColor,
    ),
  );
}
