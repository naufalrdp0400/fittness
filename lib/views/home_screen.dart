import 'package:fittness/utils/app_color.dart';
import 'package:fittness/widget/categories_card.dart';
import 'package:fittness/widget/progress_card.dart';
import 'package:flutter/material.dart';

class HomeScr1 extends StatefulWidget {
  const HomeScr1({super.key});

  @override
  State<HomeScr1> createState() => _HomeScr1State();
}

class _HomeScr1State extends State<HomeScr1> {
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 176,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [AppColor.primary, AppColor.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Start Strong and\nSet Your Fitness\nGoals",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GestureDetector(
                              onTap: () {},

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                child: Text(
                                  "Start Exercise",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          "assets/images/person.png",
                          height: 135,
                          width: 126,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Column(
                children: [
                  Text(
                    "Progress",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Progresscard(
                      title: "Strength Exercise",
                      subtitle: "10 min remaining",
                    ),
                    Progresscard(
                      title: "Torso and Trap",
                      subtitle: "5 min remaining",
                    ),
                    Progresscard(
                      title: "Abs Workout",
                      subtitle: "15 min remaining",
                    ),
                    Progresscard(
                      title: "Both Side Plank",
                      subtitle: "15 min remaining",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      CategoriesCard(
                        leading: Image.asset("assets/images/fullbody.png"),
                        title: "Full Body Warm Up",
                        subtitle: "20 Exercise - 22 Min",
                        trailing: IconButton(
                          onPressed: () {},

                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesCard(
                        leading: Image.asset("assets/images/strength.png"),
                        title: "Strength Exercise",
                        subtitle: "12 Exercise - 14 Min",
                        trailing: IconButton(
                          onPressed: () {},

                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesCard(
                        leading: Image.asset("assets/images/bothside.png"),
                        title: "Both Side Plank",
                        subtitle: "15 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},

                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesCard(
                        leading: Image.asset("assets/images/abs.png"),
                        title: "Abs Workout",
                        subtitle: "16 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},

                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesCard(
                        leading: Image.asset("assets/images/torso.png"),
                        title: "Torso and Trap",
                        subtitle: "8 Exercise - 10 Min",
                        trailing: IconButton(
                          onPressed: () {},

                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesCard(
                        leading: Image.asset("assets/images/lowerback.png"),
                        title: "Lower Back Exercise",
                        subtitle: "14 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},

                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
