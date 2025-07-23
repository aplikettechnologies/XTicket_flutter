// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/app/modules/ticket/ticket_list_tile.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 100,
      itemCount: 2,
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
      itemBuilder: (context, index) {
        return ticketListTile(context: context);
      },
    );
  }

  // Empty ticke widget
  // emptyTicketWidget(context);
}
