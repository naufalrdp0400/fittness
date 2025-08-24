import 'package:fittness/models/train.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/widget/traincard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTrain extends StatefulWidget {
  const DataTrain({super.key});
  static const id = "/dataTrain";

  @override
  State<DataTrain> createState() => _DataTrainState();
}

class _DataTrainState extends State<DataTrain> {
  List<Train> train = [];
  @override
  void initState() {
    super.initState();
    getTrain();
  }

  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String? selectedCategories;
  String? selectedStage;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> getTrain() async {
    final dataTrain = await DbHelper.getAllTrain();
    print(dataTrain);
    setState(() {
      train = dataTrain;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Image.asset(
          "assets/images/fitnesstrsp.png",
          height: 300,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Workout Logs",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.text,
                  ),
                ),
                height(20),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: train.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dataTrain = train[index];
                    return CardTrain(
                      data: dataTrain,
                      onEdit: () {
                        scheduleController.text = dataTrain.schedule;
                        timeController.text = dataTrain.time;
                        selectedCategories = dataTrain.categories;
                        selectedStage = dataTrain.stage;

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColor.background,
                            title: Text("Edit Data"),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final DateTime? pickerDate =
                                          await showDatePicker(
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
                                      child: TextFormField(
                                        controller: scheduleController,
                                        decoration: InputDecoration(
                                          labelText: "Schedule",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  GestureDetector(
                                    onTap: () async {
                                      final TimeOfDay? pickerTime =
                                          await showTimePicker(
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
                                        final formattedTime = DateFormat(
                                          "hh:mm a",
                                        ).format(time);
                                        timeController.text = formattedTime;
                                      }
                                    },
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        controller: timeController,
                                        decoration: InputDecoration(
                                          labelText: "Time",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  DropdownButtonFormField<String>(
                                    value: selectedCategories,
                                    items:
                                        [
                                          "Yoga",
                                          "Cardio",
                                          "Strength",
                                          "Stretching",
                                        ].map((String value) {
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
                                  SizedBox(height: 12),
                                  DropdownButtonFormField<String>(
                                    value: selectedStage,
                                    items:
                                        [
                                          "Beginner",
                                          "Intermediate",
                                          "Advance",
                                        ].map((String value) {
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
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.background,
                                ),
                                onPressed: () {
                                  final updateTrain = Train(
                                    id: dataTrain.id!,
                                    time: timeController.text,
                                    schedule: scheduleController.text,
                                    categories: selectedCategories ?? "",
                                    stage: selectedStage ?? "",
                                  );
                                  DbHelper.updateTrain(updateTrain);
                                  getTrain();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: AppColor.primary),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.background,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Back",
                                  style: TextStyle(color: AppColor.primary),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      onDelete: () {
                        DbHelper.deleteTrain(dataTrain.id!);
                        getTrain();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.background,
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
