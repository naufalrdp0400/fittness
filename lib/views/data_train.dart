import 'package:fittness/models/train.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Program",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColor.text,
                  ),
                ),
                height(10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: train.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dataTrain = train[index];
                    return Container(
                      height: 120,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColor.primary, AppColor.secondary],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataTrain.schedule,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              color: AppColor.text,
                            ),
                          ),
                          height(8),
                          Text(
                            dataTrain.categories,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              color: AppColor.text,
                            ),
                          ),
                          height(8),
                          Text(
                            dataTrain.stage,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              color: AppColor.text,
                            ),
                          ),
                        ],
                      ),
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

  // Container buildContainer() {
  //   return Container(
  //     height: 120,
  //     width: double.infinity,
  //     margin: EdgeInsets.only(bottom: 12),
  //     padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [AppColor.primary, AppColor.secondary],
  //       ),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [Text(data)],
  //     ),
  //   );
  // }

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
