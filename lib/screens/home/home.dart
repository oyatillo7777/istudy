import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istudy/screens/home/widgets/listTitle.dart';
import 'package:istudy/tools/colors.dart';
import 'package:istudy/widgets/sized_box.dart';
import 'package:istudy/widgets/text_widget.dart';

import '../../widgets/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List img = [
    "assets/rtm.jpg",
    "assets/najot_talim.jpg",
    "assets/iteach.jpg",
  ];
  List txt = [
    "RTM",
    "Najot ta'lim",
    "iTeach",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MobileInput(
                        hintText: "Qidiruv",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff666E7A),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Hg(height: 39,),
            TextWidget(
              txt: "Salom, Xabibulloh",
              txtColor: Colors.black,
              fontWeight: FontWeight.bold,
              size: 22.sp,
            ),
            TextWidget(
              txt: "Bajarilmagan uyga vazifalar",
              txtColor: Colors.grey,
              size: 13.sp,
            ),
            const Hg(height: 18,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 122,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 22.0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  txt: "Uyga vazifa mavjud ",
                                  txtColor: Colors.white,
                                ),
                                TextWidget(
                                  txt: "15:00 - 18:00",
                                  size: 12,
                                  txtColor: Colors.white,
                                ),
                              ],
                            ),
                            Wd(),
                            SvgPicture.asset('assets/study.svg',)
                          ],
                        ),
                      ),
                    ),
                    const Hg(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              txt: "Kompaniyalar",
                              size: 13.sp,
                            ),
                            TextWidget(
                              txt: "Hammasi",
                              size: 13.sp,
                              txtColor: AppColors.primaryColor,
                            ),
                          ],
                        ),
                        const Hg(
                          height: 17,
                        ),
                        Container(
                          height: 196,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: ListTitleWidget(
                                  img: 'assets/person.jpg',
                                  txtTitle: 'Codium',
                                  txtPlace: "Farg'ona",
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const Hg(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              txt: "O‘quv markazlari",
                              size: 13.sp,
                            ),
                            TextWidget(
                              txt: "Hammasi",
                              size: 13.sp,
                              txtColor: AppColors.primaryColor,
                            ),
                          ],
                        ),
                        const Hg(
                          height: 17,
                        ),
                        Container(
                          height: 146,
                          child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ListTitleWidget(
                                  img: img[index],
                                  txtTitle: txt[index],
                                  txtPlace: "Farg'ona",
                                  color:
                                      index == 0 ? Colors.grey : Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
