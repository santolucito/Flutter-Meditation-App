import 'package:flutter/material.dart';
import 'package:meditation/home_page.dart';
import 'package:meditation/modules.dart' as modules;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await modules.loadModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: modules.moduleInfo["title"],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
