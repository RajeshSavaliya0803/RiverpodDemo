import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_demo/screen/menu_items.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 928),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'RiverPod Demo',
            theme: ThemeData(
                primaryColor: Colors.deepPurple,
                textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Colors.deepPurple,
                  selectionHandleColor: Colors.deepPurple,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            builder: (context, widget) {
              return MediaQuery(
                ///Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            home: const MenuItems());
      },
    );
  }
}
