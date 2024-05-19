import 'package:JoDija_view/util/localization/loaclized_init.dart';
import 'package:car_peache_searcher/screens/main_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppLauncher extends StatelessWidget {
  const AppLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    // add material app here
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),

      builder: (context ,c ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainScreens(),
        );
      }
    );
  }
}
