// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../shared/widgets/skeletonizer_container.dart';

// Widget homeShimmer({required bool isLoading}) {
//   return SkeletonizerContainer(
//     enabled:
//         isLoading, // pass `true` when loading, `false` to show actual content
//     child: Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ✅ Big banner shimmer
//             Container(
//               height: 195.h,
//               width: double.infinity,
//               color: Colors.white,
//             ),
//             SizedBox(height: 18.h),

//             // ✅ Row of buttons shimmer
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Container(
//                       height: 48.h,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(100.r),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   Expanded(
//                     flex: 3,
//                     child: Container(
//                       height: 48.h,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(100.r),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       height: 48.h,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(100.r),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 24.h),

//             // ✅ Horizontal avatar list shimmer
//             SizedBox(
//               height: 80.h,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Row(
//                   children: List.generate(
//                     6,
//                     (index) => Padding(
//                       padding: EdgeInsets.only(right: 20.w),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 55.h,
//                             width: 55.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(100.r),
//                             ),
//                           ),
//                           SizedBox(height: 4.h),
//                           Container(
//                             height: 14.h,
//                             width: 55.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.r),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 24.h),

//             // ✅ Grid view shimmer
//             GridView.builder(
//               itemCount: 8,
//               padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.10,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8.r),
//                       child: Container(
//                         height: 130.h,
//                         width: double.infinity,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     Container(
//                       height: 14.h,
//                       width: 180.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
