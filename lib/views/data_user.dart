import 'package:fittness/models/user.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/widget/data_card.dart';
import 'package:flutter/material.dart';

class DataUser extends StatefulWidget {
  const DataUser({super.key});
  static const id = "/dataUser";

  @override
  State<DataUser> createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  List<User> user = [];
  @override
  void initState() {
    super.initState();
    getUser();
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> getUser() async {
    final dataUser = await DbHelper.getAllUsers();
    print(dataUser);
    setState(() {
      user = dataUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
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
                  "Database Account",
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
                  itemCount: user.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dataUser = user[index];
                    return UserCard(
                      data: dataUser,
                      onEdit: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Edit Data"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: usernameController
                                    ..text = dataUser.username,
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                  ),
                                ),
                                TextFormField(
                                  controller: emailController
                                    ..text = dataUser.email,
                                  decoration: InputDecoration(
                                    hintText: "Email Address",
                                  ),
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: passwordController
                                    ..text = dataUser.password,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  final updateUser = User(
                                    id: dataUser.id!,
                                    username: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  DbHelper.updateUser(updateUser);
                                  getUser();
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
                        DbHelper.deleteUser(dataUser.id!);
                        getUser();
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
