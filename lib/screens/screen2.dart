import 'package:flutter/material.dart';
import 'package:nti_flutter/core/utils/app_colors.dart';
import 'package:nti_flutter/core/model/bmi_model.dart';
import 'package:nti_flutter/core/widgets/bmi_calculate_texts.dart';
import 'package:nti_flutter/core/widgets/container_bmi_widget.dart';
import 'package:nti_flutter/core/widgets/custom_elevated_button.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Screen2 extends StatefulWidget {
  Screen2({super.key});
  static const String routeName = "screen2";

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int countWeight = 20;
  int countAge = 0;
  int countHeight = 50;
  late BmiModel model;
  double bmi = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = ModalRoute.of(context)?.settings.arguments as BmiModel;
  }

  @override
  void initState() {
    super.initState();
    _recalcBmi();
  }

  void _recalcBmi() {
    final h = countHeight / 100.0;
    if (h <= 0) return;
    final value = countWeight / (h * h);
    setState(() {
      bmi = double.parse(value.toStringAsFixed(1));
    });
  }

  void _changeWeight(int delta) {
    setState(() {
      countWeight += delta;
      if (countWeight < 1) countWeight = 1;

      final h = countHeight / 100.0;
      final value = countWeight / (h * h);
      bmi = double.parse(value.toStringAsFixed(1));
    });
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  void _onCalculatePressed() {
    _recalcBmi();
    _showResultDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white, leading: SizedBox()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: AppColors.green),
                  ),
                  Spacer(),
                  Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: AppColors.amber,
                    ),
                  ),
                  SizedBox(width: 7),
                  Text(
                    "Calculator",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: AppColors.green,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Please Modify the values",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBmiWidget(
                    text: "Weight (kg)",
                    textCount: "$countWeight",
                    calculateMinimize: () {
                      _changeWeight(-1);
                    },
                    calculateAdd: () {
                      _changeWeight(1);
                    },
                  ),
                  SizedBox(width: 30),
                  ContainerBmiWidget(
                    text: "Age",
                    textCount: "$countAge",
                    calculateMinimize: () {
                      setState(() {
                        countAge--;
                      });
                    },
                    calculateAdd: () {
                      setState(() {
                        countAge++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.pinkLight,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      "Height (cm)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    SimpleRulerPicker(
                      minValue: 50,
                      maxValue: 200,
                      initialValue: 100,
                      onValueChanged: (value) {
                        setState(() {
                          countHeight = value.toInt();
                          final h = countHeight / 100.0;
                          bmi = double.parse(
                            (countWeight / (h * h)).toStringAsFixed(1),
                          );
                        });
                      },
                      scaleLabelWidth: 60,
                      scaleLabelSize: 16,
                      scaleBottomPadding: 10,
                      scaleItemWidth: 12,
                      longLineHeight: 30,
                      shortLineHeight: 15,
                      lineColor: AppColors.grey,
                      selectedColor: AppColors.yellowLight,
                      labelColor: Colors.black,
                      lineStroke: 3,
                      height: 120,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              CustomElevatedButton(
                text: "Calculate",
                onPressed: _onCalculatePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResultDialog() {
    final minHealthy = 18.5 * (countHeight / 100.0) * (countHeight / 100.0);
    final maxHealthy = 24.9 * (countHeight / 100.0) * (countHeight / 100.0);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.blueLightFF,
          insetPadding: EdgeInsets.all(10), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.blueLightFF,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Your BMI:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 310,
                  width: double.infinity,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 40,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 18.5,
                            color: Colors.blue,
                          ),
                          GaugeRange(
                            startValue: 18.5,
                            endValue: 25,
                            color: Colors.green,
                          ),
                          GaugeRange(
                            startValue: 25,
                            endValue: 30,
                            color: Colors.orange,
                          ),
                          GaugeRange(
                            startValue: 30,
                            endValue: 40,
                            color: Colors.red,
                          ),
                        ],
                        pointers: <GaugePointer>[NeedlePointer(value: bmi)],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              bmi.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  getBMICategory(bmi),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(color: AppColors.grey, thickness: 1),
                BmiCalculateTexts(
                  textWeight: "$countWeight kg",
                  textHeight: "$countHeight cm",
                  textAge: "$countAge",
                  textGender: model.gender,
                ),
                SizedBox(height: 10),
                Text(
                  "Healthy weight for the height: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${minHealthy.toStringAsFixed(1)} kg - ${maxHealthy.toStringAsFixed(1)} kg",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  text: "Close",
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
