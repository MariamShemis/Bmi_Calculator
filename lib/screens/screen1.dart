import 'package:flutter/material.dart';
import 'package:nti_flutter/core/utils/app_assets.dart';
import 'package:nti_flutter/core/utils/app_colors.dart';
import 'package:nti_flutter/core/model/bmi_model.dart';
import 'package:nti_flutter/core/widgets/custom_elevated_button.dart';
import 'package:nti_flutter/screens/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});
  static const String routeName = "screen1";

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String selectgender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.amber,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Calculator",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Please choose your gender",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  setState(() {
                    selectgender = "male";
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.blueLightFF,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.green,
                        ),
                      ),
                      Image.asset(AppAssets.male),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    selectgender = "female";
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.pinkLight,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.amber,
                        ),
                      ),
                      Image.asset(AppAssets.female),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              CustomElevatedButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Screen2.routeName,
                    arguments: BmiModel(gender: selectgender),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
