import 'package:fittness/models/train.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class Training1 extends StatefulWidget {
  const Training1({super.key});

  @override
  State<Training1> createState() => _Training1State();
}

class _Training1State extends State<Training1> {
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String? selectedCategories;
  String? selectedStage;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
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
    final time = timeController.text;
    final categories = selectedCategories;
    final stage = selectedStage;

    if (schedule.isEmpty ||
        time.isEmpty ||
        categories == null ||
        stage == null ||
        !isChecked) {
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
      time: time,
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
                  "Log Workout",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.text,
                  ),
                ),
                height(30),
                GestureDetector(
                  onTap: () async {
                    final DateTime? pickerDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2025),
                      lastDate: DateTime(2026),
                    );
                    if (pickerDate != null) {
                      final formatted = DateFormat(
                        'd MMMM yyyy',
                        'id_ID',
                      ).format(pickerDate);
                      scheduleController.text = formatted;
                    }
                  },
                  child: AbsorbPointer(
                    child: buildTextField(
                      controller: scheduleController,
                      labelText: "Schedule",
                      hintText: "Select of Date",
                    ),
                  ),
                ),
                height(10),
                GestureDetector(
                  onTap: () async {
                    final TimeOfDay? pickerTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickerTime != null) {
                      final now = DateTime.now();
                      final time = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        pickerTime.hour,
                        pickerTime.minute,
                      );
                      final formattedTime = DateFormat.jm("id_ID").format(time);
                      timeController.text = formattedTime;
                    }
                  },
                  child: AbsorbPointer(
                    child: buildTextField(
                      controller: timeController,
                      labelText: "Time",
                      hintText: "Select of Time",
                    ),
                  ),
                ),
                height(10),
                DropdownButtonFormField<String>(
                  value: selectedCategories,
                  items: ["Yoga", "Cardio", "Strength", "Stretching"].map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Categories",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedCategories = value!;
                    });
                  },
                ),
                height(10),
                DropdownButtonFormField<String>(
                  value: selectedStage,
                  items: ["Beginner", "Intermediate", "Advance"].map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Stage",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedStage = value!;
                    });
                  },
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
                              "Submit",
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
