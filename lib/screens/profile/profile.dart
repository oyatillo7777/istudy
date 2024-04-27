import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istudy/widgets/sized_box.dart';
import 'package:istudy/widgets/text_widget.dart';

import '../../chart/myBarChart.dart';
import '../../tools/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 360,
            color: AppColors.primaryColor,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Hg(
                      height: 30,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/img.png"),
                      radius: 40,
                    ),
                    const Hg(
                      height: 24,
                    ),
                    TextWidget(
                      txt: "Nurullayev Xabibulloh",
                      txtColor: Colors.white,
                      size: 18.sp,
                    ),
                    const Hg(
                      height: 4,
                    ),
                    TextWidget(
                      txt: "Raqamli Texnalogiyalar Markazi, C++ o‘quvchisi",
                      txtColor: Colors.white,
                      size: 13.sp,
                    ),
                    const Hg(
                      height: 16,
                    ),
                    Container(
                      width: 85,
                      height: 26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.10),
                            // Shadow color
                            spreadRadius: 2,
                            // Spread radius
                            blurRadius: 5,
                            // Blur radius
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: TextWidget(
                          txt: "O‘zgartirish",
                          size: 10,
                          txtColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const Hg(
                      height: 36,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardWidget(
                          title: 'Eng yuqori ball',
                          son: '94',
                        ),
                        Wd(
                          width: 21,
                        ),
                        CardWidget(
                          title: 'Eng past ball',
                          son: '62',
                          color: Color(0xffFFB55C),
                        ),
                      ],
                    ),
                    const Hg(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        height: 300,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(txt: "O‘rtacha ballar",size: 13,),
                                  Row(
                                    children: [
                                      TextWidget(txt: "Oylik",size: 13,),
                                      Icon(Icons.keyboard_arrow_down_outlined)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: MyBarGraph(
                                weeklySummary: weeklySummary,
                              ),
                            ),
                            Hg(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
