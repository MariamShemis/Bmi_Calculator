import 'package:flutter/material.dart';
import 'package:nti_flutter/core/utils/app_colors.dart' show AppColors;

class ContainerBmiWidget extends StatelessWidget {
  const ContainerBmiWidget({
    super.key,
    required this.text,
    required this.textCount,
    required this.calculateMinimize,
    required this.calculateAdd,
  });
  final String text;
  final String textCount;
  final VoidCallback calculateMinimize;
  final VoidCallback calculateAdd;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.pinkLight,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ),
            Text(
              textCount,
              // "$countAge",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.yellowLight,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: calculateMinimize,
                  // setState(() {
                  //   countAge--;
                  // });
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white,
                    fixedSize: Size(10, 30),
                  ),
                  icon: Icon(
                    Icons.minimize_sharp,
                    color: AppColors.yellowLight,
                  ),
                ),
                IconButton(
                  onPressed: calculateAdd,
                  // setState(() {
                  //   countAge++;
                  // });
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white,
                    fixedSize: Size(10, 30),
                  ),
                  icon: Icon(Icons.add, color: AppColors.yellowLight),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
