import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xticket/shared/localization/localization.dart';
import 'package:xticket/shared/utils/app_color.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';
import '../shared/utils/app_configuration.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'XTicket',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: AppColor.white,
        ),
        initialRoute: AppRoutes.home,
        getPages: AppPages.routes,
        supportedLocales: [Locale('en'), Locale('ar')],
        localizationsDelegates: [
          Localization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale(AppConfiguration.languageCode),
      ),
    );
  }
}
