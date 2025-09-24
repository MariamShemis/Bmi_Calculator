import 'package:flutter/material.dart';
import 'package:nti_flutter/core/utils/app_colors.dart';

class BmiCalculateTexts extends StatelessWidget {
  const BmiCalculateTexts({
    super.key,
    required this.textWeight,
    required this.textHeight,
    required this.textAge,
    required this.textGender,
  });
  final String textWeight;
  final String textHeight;
  final String textAge;
  final String textGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              textWeight,

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.green,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Weight",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              textHeight,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.green,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Height",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              textAge,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.green,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Age",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              textGender,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.green,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Gender",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
