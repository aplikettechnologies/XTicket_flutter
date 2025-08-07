import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xticket/app/modules/createEvent/create_event_controller.dart';
import 'package:xticket/shared/localization/localization_const.dart';
import 'package:xticket/shared/utils/app_assets.dart';
import 'package:xticket/shared/utils/app_color.dart';
import 'package:xticket/shared/utils/app_style.dart';
import 'package:xticket/shared/utils/app_validator.dart';
import 'package:xticket/shared/widgets/app_button.dart';
import 'package:xticket/shared/widgets/app_textformfield.dart';
import 'package:xticket/shared/widgets/app_toast.dart';

Widget generalTab({required BuildContext context}) {
  CreateEventController controller = Get.put(CreateEventController());
  return Form(
    autovalidateMode: AutovalidateMode.onUnfocus,
    key: controller.generalTabformKey,
    child: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),

            //UploadImage
            InkWell(
              onTap: () {
                controller.getImage(ImageSource.gallery);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                constraints: BoxConstraints(minHeight: 194.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColor.grey2, width: 1.w),
                ),
                child:
                    controller.selectedImages.isNotEmpty
                        ? GridView.builder(
                          itemCount: controller.selectedImages.length,
                          padding: EdgeInsets.all(16.w),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1.10,
                                crossAxisSpacing: 5.w,
                                mainAxisSpacing: 5.h,
                              ),
                          itemBuilder: (context, index) {
                            return Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.file(
                                  controller.selectedImages[index],
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),

                                InkWell(
                                  onTap: () {
                                    controller.selectedImages.removeAt(index);
                                    controller.update();
                                  },
                                  child: Container(
                                    height: 18.h,
                                    width: 18.w,
                                    margin: EdgeInsets.only(
                                      top: 3.h,
                                      right: 3.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.grey.withValues(
                                        alpha: 0.5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(AppAssets.icClose),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.w),
                              decoration: BoxDecoration(
                                color: AppColor.neutralColor08,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.icUpload,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              getTranslation(
                                context,
                                'create_event.upload_your_image',
                              ),
                            ),
                          ],
                        ),
              ),
            ),
            SizedBox(height: 16.h),

            //UploadProfie
            Text(
              getTranslation(context, 'create_event.upload_profile'),
              style: AppStyle.darkSemibold18Manrope,
            ),
            SizedBox(height: 8.h),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 106.h, maxHeight: 42.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: AppColor.primaryColor04, width: 1.w),
              ),
              child: SvgPicture.asset(
                AppAssets.icUpload,
                height: 24.h,
                width: 24.w,
                colorFilter: ColorFilter.mode(
                  AppColor.primaryColor04,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(height: 16.h),

            //EventTitle
            appTextFormField(
              textEditingController: controller.eventTitleTextController,
              context: context,
              headerStyle: AppStyle.darkSemibold18Manrope,
              headerText: getTranslation(context, 'create_event.event_title'),
              filled: false,
              textCapitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              validator:
                  (value) => AppValidator.isFieldEmptyValidation(
                    value: value,
                    title: getTranslation(context, 'create_event.event_title'),
                    context: context,
                  ),
              enableBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.grey2, width: 1.w),
                borderRadius: BorderRadius.circular(100.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.primaryColor04,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            SizedBox(height: 16.h),

            //EventCategory
            appTextFormField(
              textEditingController: controller.eventCategoryTextController,
              context: context,
              headerStyle: AppStyle.darkSemibold18Manrope,
              headerText: getTranslation(
                context,
                'create_event.event_category',
              ),
              validator:
                  (value) => AppValidator.isFieldEmptyValidation(
                    value: value,
                    title: getTranslation(
                      context,
                      'create_event.event_category',
                    ),
                    context: context,
                  ),
              filled: false,
              textCapitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              enableBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.grey2, width: 1.w),
                borderRadius: BorderRadius.circular(100.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.primaryColor04,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            SizedBox(height: 16.h),

            //EventDescription
            appTextFormField(
              textEditingController: controller.eventDescriptionTextController,
              context: context,
              headerStyle: AppStyle.darkSemibold18Manrope,
              headerText: getTranslation(
                context,
                'create_event.event_description',
              ),
              validator:
                  (value) => AppValidator.isFieldEmptyValidation(
                    value: value,
                    title: getTranslation(
                      context,
                      'create_event.event_description',
                    ),
                    context: context,
                  ),
              filled: false,
              textCapitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              maxLines: 5,
              enableBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.grey2, width: 1.w),
                borderRadius: BorderRadius.circular(14.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.red, width: 1.w),
                borderRadius: BorderRadius.circular(14.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.red, width: 1.w),
                borderRadius: BorderRadius.circular(14.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.primaryColor04,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            SizedBox(height: 56.h),

            //Next
            appButton(
              context: context,
              text: getTranslation(context, 'create_event.next'),
              onPressed: () {
                if (controller.generalTabformKey.currentState!.validate()) {
                  if (controller.selectedImages.isNotEmpty) {
                    if (controller.tabController.index <
                        controller.tabController.length - 1) {
                      controller.tabController.animateTo(
                        controller.tabController.index + 1,
                      );
                    }
                  } else {
                    AppToast.showSuccess(
                      title: getTranslation(context, 'app_validation.error'),
                      subTitle: getTranslation(
                        context,
                        'app_validation.please_upload_event_image',
                      ),
                      context: context,
                    );
                  }
                }
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    ),
  );
}
