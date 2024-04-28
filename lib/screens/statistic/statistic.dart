import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istudy/screens/statistic/cubit/student_cubit.dart';
import 'package:istudy/tools/colors.dart';
import 'package:istudy/widgets/sized_box.dart';
import 'package:istudy/widgets/text_widget.dart';

class StaticticScreen extends StatefulWidget {
  const StaticticScreen({super.key});

  @override
  State<StaticticScreen> createState() => _StaticticScreenState();
}

class _StaticticScreenState extends State<StaticticScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<StudentCubit>().getStudent();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 272,
            color: AppColors.primaryColor,
          ),
          BlocBuilder<StudentCubit, StudentState>(
            builder: (BuildContext context, state) {
              if (state is StudentLoadingState) {
                return const Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.black,));
              } else if (state is StudentSuccessState) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Hg(
                            height: 20,
                          ),
                          TextWidget(
                            txt: "O‘quvchilar jadvali",
                            txtColor: Colors.white,
                            size: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            txt: "Barcha markazlar bo‘yicha",
                            txtColor: Colors.white,
                            size: 13.sp,
                          ),
                          const Hg(
                            height: 24,
                          ),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: state.data.data.values.length,
                            itemBuilder: (context, index) {
                              var data=state.data.data.values[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.10), // Shadow color
                                        spreadRadius: 2, // Spread radius
                                        blurRadius: 5, // Blur radius
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  width: double.infinity,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundColor: index == 0
                                                  ? Colors.amber
                                                  : index == 1
                                                      ? Colors.grey
                                                      : index == 2
                                                          ? Colors.deepOrange
                                                          : Colors.white,
                                              child: Center(
                                                child: TextWidget(
                                                  txt: "${index + 1}",
                                                  size: 11,
                                                  txtColor: index == 0
                                                      ? Colors.white
                                                      : index == 1
                                                          ? Colors.white
                                                          : index == 2
                                                              ? Colors.white
                                                              : Colors.black,
                                                ),
                                              ),
                                            ),
                                            const Wd(
                                              width: 10,
                                            ),
                                            const CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  'assets/img_1.png'),
                                            ),
                                            const Wd(
                                              width: 10,
                                            ),
                                             Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextWidget(
                                                  txt: data.fullname??'',
                                                  size: 13,
                                                ),
                                                const TextWidget(
                                                  txt: "C++",
                                                  size: 11,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                         TextWidget(
                                          txt: "${data.ball}"??'',
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is StudentErrorState) {
                return TextWidget(txt: state.error);
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
