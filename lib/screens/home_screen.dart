import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pondough_mobile/screens/transaction_screen.dart';
import 'package:pondough_mobile/screens/stats_screen.dart';
import 'package:pondough_mobile/screens/agent_screen.dart';
import 'package:pondough_mobile/screens/savings_screen.dart';
import 'package:pondough_mobile/screens/accounts_screen.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';

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
        child: Icon(
          Icons.mic,
          size: 32,
          color: FB_TEXT_COLOR_WHITE,
        ),
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
              _buildNavItem(Icons.receipt_long, 'Transactions', 0),
              _buildNavItem(Icons.bar_chart, 'Stats', 1),
              SizedBox(width: 80.w), // Space for FAB
              _buildNavItem(Icons.savings, 'Savings', 3),
              _buildNavItem(Icons.account_balance_wallet, 'Accounts', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _onTappedBar(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? FB_PRIMARY : Colors.grey,
              size: ScreenUtil().setSp(24),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? FB_PRIMARY : Colors.grey,
                fontSize: ScreenUtil().setSp(10),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
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
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
