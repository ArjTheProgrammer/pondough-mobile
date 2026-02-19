import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryCards extends StatelessWidget {
  final String income;
  final String expenses;
  final String total;

  const SummaryCards({
    super.key,
    required this.income,
    required this.expenses,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: SummaryCard(
              label: 'Income',
              amount: income,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SummaryCard(
              label: 'Expenses',
              amount: expenses,
              color: Color(0xFFFF6B6B),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: SummaryCard(
              label: 'Total',
              amount: total,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String label;
  final String amount;
  final Color color;

  const SummaryCard({
    super.key,
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 4.h),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
