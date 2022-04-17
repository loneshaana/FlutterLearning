import 'package:basics/shared/menu_bottom.dart';
import 'package:basics/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height, weight;
  late List<bool> isSelected;
  String heightMsg = '';
  String weightMsg = '';

  // LifeCycle of stateful widget

  // initstate -> Similar to constructor

  // build

  //dispose -> Before the widget is removed from tree

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    heightMsg =
        'Please enter your height in ' + (isMetric ? 'meters' : 'inches');

    weightMsg =
        'Please enter your height in ' + (isMetric ? 'kilos' : 'pounds');

    return Scaffold(
      appBar: AppBar(title: const Text("Bmi Calculator")),
      // body: const Center(child: FlutterLogo()),
      bottomNavigationBar: const MenuBottom(),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Metric',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Imperial',
                    style: TextStyle(fontSize: fontSize),
                  ),
                )
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtHeight,
                decoration: InputDecoration(hintText: heightMsg),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: txtWeight,
                decoration: InputDecoration(hintText: weightMsg),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: findBmi,
              child: Text(
                'Calculate Bmi',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      // set isMetric to true
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = (weight * 703) / (height * height);
    }
    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }
}
