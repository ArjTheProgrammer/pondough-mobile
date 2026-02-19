import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionItem extends StatelessWidget {
  final String category;
  final String description;
  final String account;
  final double amount;
  final IconData icon;
  final DateTime transactionDate;
  final bool isIncome;

  const TransactionItem({
    super.key,
    required this.category,
    required this.description,
    required this.account,
    required this.amount,
    required this.icon,
    required this.transactionDate,
    this.isIncome = false,
  });

  @override
  Widget build(BuildContext context) {
    final formattedAmount = '\$${amount.abs().toStringAsFixed(2)}';
    final amountColor = isIncome ? Colors.blue : Colors.grey[700]!;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SizedBox(width: 50.w),
          SizedBox(width: 12.w),
          // Icon
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: Colors.grey[600], size: 20.sp),
          ),
          SizedBox(width: 12.w),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
                SizedBox(height: 2.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (account.isNotEmpty)
                  Text(
                    account,
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey[500]),
                  ),
              ],
            ),
          ),
          // Amount
          Text(
            formattedAmount,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
