import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_scope/constant/my_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.hint,
    this.fillColor,
    this.isPasswordField = false,
    this.isEmailField = false,
    this.isSearchField = false,
  });

  final bool isEmailField;
  final bool isSearchField;
  final bool isPasswordField;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final String? label;
  final String? hint;
  final Color? fillColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      style: TextStyle(color: MyColors.activeColor),
      obscureText: widget.isPasswordField ? _obscureText : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        prefixIcon: widget.isSearchField ? Icon(Icons.search) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.h),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: widget.label == null ? null : Text(widget.label!),
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
        fillColor: widget.fillColor,
        suffixIcon:
        widget.isPasswordField
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : widget.isEmailField
            ? Icon(Icons.email)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: MyColors.activeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: MyColors.activeColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: MyColors.activeColor),
        ),
      ),
    );
  }
}
