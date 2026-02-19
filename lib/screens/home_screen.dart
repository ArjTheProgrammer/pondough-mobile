import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pondough_mobile/screens/transaction_screen.dart';
import 'package:pondough_mobile/screens/stats_screen.dart';
import 'package:pondough_mobile/screens/agent_screen.dart';
import 'package:pondough_mobile/screens/savings_screen.dart';
import 'package:pondough_mobile/screens/accounts_screen.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/nav_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: CustomFont(
          text: 'Pondough',
          fontSize: ScreenUtil().setSp(25),
          color: FB_PRIMARY,
          fontFamily: 'Klavika',
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          TransactionScreen(),
          StatsScreen(),
          AgentScreen(),
          SavingsScreen(),
          AccountsScreen(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTappedBar(2),
        backgroundColor: _selectedIndex == 2 ? FB_PRIMARY : FB_SECONDARY,
        shape: const CircleBorder(),
        child: Icon(Icons.mic, size: 32, color: FB_TEXT_COLOR_WHITE),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.receipt_long,
                label: 'Transactions',
                isSelected: _selectedIndex == 0,
                onTap: () => _onTappedBar(0),
              ),
              NavItem(
                icon: Icons.bar_chart,
                label: 'Stats',
                isSelected: _selectedIndex == 1,
                onTap: () => _onTappedBar(1),
              ),
              SizedBox(width: 80.w), // Space for FAB
              NavItem(
                icon: Icons.savings,
                label: 'Savings',
                isSelected: _selectedIndex == 3,
                onTap: () => _onTappedBar(3),
              ),
              NavItem(
                icon: Icons.account_balance_wallet,
                label: 'Accounts',
                isSelected: _selectedIndex == 4,
                onTap: () => _onTappedBar(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
