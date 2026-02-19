import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomFont(
        text: 'Accounts & Debt Center',
        fontSize: ScreenUtil().setSp(20),
        color: FB_PRIMARY,
        fontFamily: 'Klavika',
      ),
    );
  }
}
