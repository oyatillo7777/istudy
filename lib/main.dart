import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:istudy/screens/home/cubit/category/category_cubit.dart';
import 'package:istudy/screens/home/cubit/education/education_cubit.dart';
import 'package:istudy/screens/splash/splash.dart';
import 'package:istudy/screens/statistic/cubit/student_cubit.dart';
import 'package:istudy/tools/responsive.dart';

// DioRequestInspector dioRequestInspector = DioRequestInspector(
//   isDebugMode: kDebugMode,
// );

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoryCubit(),
        ),
        BlocProvider(
          create: (_) => EducationCubit(),
        ),
        BlocProvider(
          create: (_) => StudentCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size designSize = ResponsiveLayout.isMobile(context)
        ? const Size(375, 812)
        : ResponsiveLayout.isTablet(context)
            ? const Size(820, 1110)
            : const Size(1680, 1050);
    return ScreenUtilInit(
      designSize: designSize,
      child: const GetMaterialApp(
        // navigatorKey: dioRequestInspector.,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
