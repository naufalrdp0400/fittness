import 'package:fittness/models/train.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class Training1 extends StatefulWidget {
  const Training1({super.key});

  @override
  State<Training1> createState() => _Training1State();
}

class _Training1State extends State<Training1> {
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  bool isLoading = false;
  bool isChecked = false;
  MSHCheckboxStyle style = MSHCheckboxStyle.stroke;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Image.asset(
          "assets/images/fitnesstrsp.png",
          fit: BoxFit.cover,
          height: 300,
          width: 100,
        ),
      ),
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  void registerTrain() async {
    isLoading = true;
    setState(() {});
    final schedule = scheduleController.text;
    final categories = categoriesController.text;
    final stage = stageController.text;
    if (schedule.isEmpty || categories.isEmpty || stage.isEmpty || !isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "All field must be filled and checkbox must be checked",
          ),
        ),
      );
      isLoading = false;

      return;
    }
    final train = Train(
      schedule: schedule,
      categories: categories,
      stage: stage,
    );
    await DbHelper.registerTrain(train);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Never Give Up")));
    });
    setState(() {});
    isLoading = false;
  }

  TextField buildTextField({
    String? hintText,
    String? labelText,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.text),
        labelText: labelText,
        labelStyle: TextStyle(color: AppColor.text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.background,
    );
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Set Your Exercise Program",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.text,
                  ),
                ),
                height(30),
                buildTextField(
                  controller: scheduleController,
                  labelText: "Schedule",
                  hintText: "Please set your schedule",
                ),
                height(10),
                buildTextField(
                  controller: categoriesController,
                  labelText: "Categories",
                  hintText: "Select the category you want",
                ),
                height(10),
                buildTextField(
                  controller: stageController,
                  labelText: "Stage",
                  hintText: "Select the stage you want",
                ),
                height(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MSHCheckbox(
                      size: 30,
                      value: isChecked,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: AppColor.accent,
                      ),
                      style: style,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    SizedBox(width: 15),
                    Text(
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: AppColor.text,
                      ),
                      isChecked == true ? "Keep Your Spirit" : "Are You Sure?",
                    ),
                  ],
                ),
                height(15),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [AppColor.primary, AppColor.secondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        isLoading ? null : registerTrain();
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Save Data",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
