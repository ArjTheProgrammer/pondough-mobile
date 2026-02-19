import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateNavigation extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const DateNavigation({
    super.key,
    required this.selectedDate,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.chevron_left), onPressed: onPrevious),
          Text(
            _getMonthYearString(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          IconButton(icon: Icon(Icons.chevron_right), onPressed: onNext),
        ],
      ),
    );
  }

  String _getMonthYearString() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[selectedDate.month - 1]} ${selectedDate.year}';
  }
}
