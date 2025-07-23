import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_list.dart';

class EventController extends GetxController {
  List<Map<String, dynamic>> categoryList = [];

  EventController({required BuildContext context}) {
    categoryList = AppList.appEventCategoryList(context);
  }
}
