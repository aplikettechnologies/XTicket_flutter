import 'package:flutter/material.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';

class AppList {
  static List<Map<String, dynamic>> appEventCategoryList(BuildContext context) {
    return [
      {
        'icon': AppAssets.icTechnology,
        'name': getTranslation(context, 'event.technology'),
      },
      {
        'icon': AppAssets.icSeminars,
        'name': getTranslation(context, 'event.seminars'),
      },
      {
        'icon': AppAssets.icEducation,
        'name': getTranslation(context, 'event.education'),
      },
      {
        'icon': AppAssets.icConcerts,
        'name': getTranslation(context, 'event.concerts'),
      },
      {
        'icon': AppAssets.icWorkshops,
        'name': getTranslation(context, 'event.workshops'),
      },
      {
        'icon': AppAssets.icHealth,
        'name': getTranslation(context, 'event.health'),
      },
    ];
  }
}
