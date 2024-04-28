import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istudy/screens/home/cubit/category/category_cubit.dart';
import 'package:istudy/screens/home/cubit/education/education_cubit.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CategoryCubit>().getCategory();
      context.read<EducationCubit>().getEducation();
    });
    super.initState();
  }

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
            const Hg(
              height: 39,
            ),
            TextWidget(
              txt: "Salom, Xabibulloh",
              txtColor: Colors.black,
              fontWeight: FontWeight.bold,
              size: 22.sp,
            ),
            TextWidget(
              txt: "",
              txtColor: Colors.grey,
              size: 13.sp,
            ),
            const Hg(
              height: 18,
            ),
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
                                  txt: "Test mavjud ",
                                  txtColor: Colors.white,
                                ),
                                TextWidget(
                                  txt: "04.07.2024",
                                  size: 12,
                                  txtColor: Colors.white,
                                ),
                              ],
                            ),
                            const Wd(),
                            SvgPicture.asset(
                              'assets/study.svg',
                            )
                          ],
                        ),
                      ),
                    ),
                    const Hg(
                      height: 30,
                    ),
                    BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else if (state is CategorySuccessState) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              SizedBox(
                                height: 196,
                                child: ListView.builder(
                                  itemCount: state.data.data!.values?.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var dataa = state.data.data?.values?[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: ListTitleWidget(
                                        img: 'assets/person.jpg',
                                        txtTitle:
                                            dataa?.name ?? "Null this is ",
                                        txtPlace:
                                            dataa?.description ?? "Farg'ona",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else if (state is CategoryErrorState) {
                          return TextWidget(txt: state.error);
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const Hg(
                      height: 30,
                    ),
                    BlocBuilder<EducationCubit, EducationState>(
                      builder: (context, state) {
                        if (state is EducationLoadingState) {
                          return SizedBox();
                        } else if (state is EducationSuccessState) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              SizedBox(
                                height: 146,
                                child: ListView.builder(
                                  itemCount: state.data.values.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var data = state.data.values[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: ListTitleWidget(
                                        img: img[index],
                                        txtTitle: data.name ?? '',
                                        txtPlace: data.description ?? '',
                                        color: index == 0
                                            ? Colors.grey
                                            : Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else if (state is EducationErrorState) {
                          return TextWidget(txt: state.error);
                        } else {
                          return SizedBox();
                        }
                      },
                    )
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
