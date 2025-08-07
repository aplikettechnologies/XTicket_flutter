import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventController extends GetxController
    with GetTickerProviderStateMixin {
  final generalTabformKey = GlobalKey<FormState>();
  final locationTabformKey = GlobalKey<FormState>();
  final detailsTabformKey = GlobalKey<FormState>();
  final confirmTabformKey = GlobalKey<FormState>();
  CroppedFile? croppedFile;
  late TabController tabController;
  String? selectedPrice;
  String? selectStartTime;
  String? selectEndTime;
  List<File> selectedImages = [];

  TextEditingController eventTitleTextController = TextEditingController();
  TextEditingController eventCategoryTextController = TextEditingController();
  TextEditingController eventDescriptionTextController =
      TextEditingController();
  TextEditingController searchLocationTextController = TextEditingController();
  TextEditingController selectLocationTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController contactNoTextController = TextEditingController();
  TextEditingController wpNoTextController = TextEditingController();
  TextEditingController socialLinkTextController = TextEditingController();

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void onSelectedPrice({required String price}) {
    selectedPrice = price;
  }

  Future<void> getImage(ImageSource source) async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      selectedImages = pickedFiles.map((file) => File(file.path)).toList();
    }
    update();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
