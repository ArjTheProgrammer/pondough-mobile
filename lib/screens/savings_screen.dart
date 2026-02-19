import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomFont(
        text: 'Savings Goals',
        fontSize: ScreenUtil().setSp(20),
        color: FB_PRIMARY,
        fontFamily: 'Klavika',
      ),
    );
  }
}
