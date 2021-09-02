import 'package:delivery_app/colors.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: AppColors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primary,
      width: 2.0,
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primary,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primary,
      width: 2.0,
    ),
  ),
);
