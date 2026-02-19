import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'transaction_item.dart';

class TransactionGroup extends StatelessWidget {
  final DateTime date;
  final List<TransactionItem> items;
  final double totalIncome;
  final double totalExpense;

  const TransactionGroup({
    super.key,
    required this.date,
    required this.items,
    required this.totalIncome,
    required this.totalExpense,
  });

  @override
  Widget build(BuildContext context) {
    final dayOfMonth = date.day;
    final dayOfWeek = DateFormat('EEE').format(date);
    final formattedIncome = '\$${totalIncome.toStringAsFixed(2)}';
    final formattedExpense = '\$${totalExpense.toStringAsFixed(2)}';

    return Column(
      children: [
        // Date Header
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              // Date
              SizedBox(
                width: 50.w,
                child: Column(
                  children: [
                    Text(
                      '$dayOfMonth',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        dayOfWeek,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Income/Expense
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedIncome,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formattedExpense,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFFFF6B6B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Transaction Items
        ...items,
        Divider(height: 1),
      ],
    );
  }
}
