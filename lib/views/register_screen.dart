import 'package:fittness/models/user.dart';
import 'package:fittness/sqflite/db_helper.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/utils/app_image.dart';
import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});
  static const id = "/register";

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  void registerUser() async {
    isLoading = true;
    setState(() {});
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username, Email, and Password cannot be empty"),
        ),
      );
      isLoading = false;
      return;
    }
    final user = User(username: username, email: email, password: password);
    await DbHelper.registerUser(user);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful")));
    });
    setState(() {});
    isLoading = false;
  }

  TextField buildTextField({
    String? labelText,
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
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
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
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

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.barble, height: 225, width: 225),
                Text(
                  "Make Yourself",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.oranye,
                  ),
                ),
                Text(
                  "Better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.birutua,
                  ),
                ),
                height(20),
                buildTextField(
                  controller: usernameController,
                  labelText: "Username",
                  hintText: "Please input your username",
                ),
                height(10),
                buildTextField(
                  controller: emailController,
                  labelText: "Email Address",
                  hintText: "Please input your email",
                ),
                height(10),
                buildTextField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Please input your password",
                  isPassword: true,
                ),
                height(10),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.oranye,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      isLoading ? null : registerUser();
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Register",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.birutua,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
