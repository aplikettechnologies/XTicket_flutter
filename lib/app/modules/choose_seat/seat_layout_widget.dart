import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xticket/shared/utils/app_color.dart';

class SeatLayout extends StatelessWidget {
  final int totalSeats;
  final int rows; // vertical lines
  final int columns; // horizontal seats per row
  final double seatSize;
  final List<int> selectedSeats; // optional: green
  final List<int> reservedSeats; // optional: yellow
  final Function(int)? onSeatTap; // 👈 Callback for tap

  const SeatLayout({
    super.key,
    required this.totalSeats,
    required this.rows,
    required this.columns,
    this.seatSize = 12,
    required this.selectedSeats,
    required this.reservedSeats,
    this.onSeatTap,
  });

  @override
  Widget build(BuildContext context) {
    final int maxSeats = rows * columns;
    final int seatCount = totalSeats.clamp(0, maxSeats);

    final double screenWidth = MediaQuery.of(context).size.width - 50;
    final double totalSeatWidth =
        columns * seatSize * 1.7; // Increased width buffer
    final double spacing = (screenWidth - totalSeatWidth) / (columns - 1);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Wrap(
        spacing: spacing < 2 ? 2 : spacing, // Ensures minimum spacing
        runSpacing: spacing < 2 ? 2 : spacing,
        children: List.generate(seatCount, (index) {
          bool isSelected = selectedSeats.contains(index);
          bool isReserved = reservedSeats.contains(index);

          Color color = Colors.grey.shade400;
          if (isSelected) {
            color = AppColor.lightYellow1;
          } else if (isReserved) {
            color = AppColor.primaryColor04;
          }

          return InkWell(
            onTap:
                (!isSelected && !isReserved && onSeatTap != null)
                    ? () => onSeatTap!(index)
                    : null,
            child: Container(
              height: seatSize,
              width: seatSize,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          );
        }),
      ),
    );
  }
}
