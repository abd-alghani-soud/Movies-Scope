import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDismissibleBackground extends StatelessWidget {
  final Alignment alignment;

  const BuildDismissibleBackground({super.key, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
      ),
    );
  }
}
