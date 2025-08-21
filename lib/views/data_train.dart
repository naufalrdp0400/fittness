import 'package:fittness/models/train.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/widget/train_card.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController stageController = TextEditingController();

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
                  " Exercise Program",
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
                    return TrainCard(
                      data: dataTrain,
                      onEdit: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Edit Data"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: scheduleController
                                    ..text = dataTrain.schedule,
                                  decoration: InputDecoration(
                                    hintText: "Schedule",
                                  ),
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: categoriesController
                                    ..text = dataTrain.categories,
                                  decoration: InputDecoration(
                                    hintText: "Categories",
                                  ),
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: stageController
                                    ..text = dataTrain.stage,
                                  decoration: InputDecoration(
                                    hintText: "Stage",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  final updateTrain = Train(
                                    id: dataTrain.id!,
                                    schedule: scheduleController.text,
                                    categories: categoriesController.text,
                                    stage: stageController.text,
                                  );
                                  DbHelper.updateTrain(updateTrain);
                                  getTrain();
                                  Navigator.pop(context);
                                },
                                child: Text("Save"),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Back"),
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
