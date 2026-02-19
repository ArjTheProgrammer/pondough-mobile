import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/date_navigation.dart';
import '../widgets/summary_cards.dart';
import '../widgets/transaction_group.dart';
import '../widgets/transaction_item.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Transaction',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // Date Navigation
          DateNavigation(
            selectedDate: selectedDate,
            onPrevious: () {
              setState(() {
                selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month - 1,
                );
              });
            },
            onNext: () {
              setState(() {
                selectedDate = DateTime(
                  selectedDate.year,
                  selectedDate.month + 1,
                );
              });
            },
          ),

          // Tab Navigation using Material TabBar
          Material(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Color(0xFFFF6B6B),
              labelColor: Color(0xFFFF6B6B),
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              tabs: const [
                Tab(text: 'Daily'),
                Tab(text: 'Calendar'),
                Tab(text: 'Weekly'),
                Tab(text: 'Monthly'),
                Tab(text: 'Summary'),
              ],
            ),
          ),

          // Summary Cards
          SummaryCards(
            income: '\$ 4,831.89',
            expenses: '\$ 2,442.93',
            total: '\$ 2,388.96',
          ),

          // Transaction List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTransactionList(), // Daily
                Center(child: Text('Calendar View')),
                Center(child: Text('Weekly View')),
                Center(child: Text('Monthly View')),
                Center(child: Text('Summary View')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    // Sample data using proper DateTime objects
    final transactionGroups = [
      TransactionGroup(
        date: DateTime(2026, 1, 29),
        totalIncome: 0.00,
        totalExpense: 34.39,
        items: [
          TransactionItem(
            category: 'Social Life',
            description: 'brunch with daniel',
            account: 'HIBD Debit Card',
            amount: 34.39,
            icon: Icons.people,
            transactionDate: DateTime(2026, 1, 29),
            isIncome: false,
          ),
        ],
      ),
      TransactionGroup(
        date: DateTime(2026, 1, 28),
        totalIncome: 0.00,
        totalExpense: 630.96,
        items: [
          TransactionItem(
            category: 'Household',
            description: 'ikea wardrobe',
            account: 'BBD Credit Card',
            amount: 315.48,
            icon: Icons.home,
            transactionDate: DateTime(2026, 1, 28),
            isIncome: false,
          ),
          TransactionItem(
            category: 'Household',
            description: 'ikea wardrobe',
            account: 'BBD Credit Card',
            amount: 315.48,
            icon: Icons.home,
            transactionDate: DateTime(2026, 1, 28),
            isIncome: false,
          ),
        ],
      ),
      TransactionGroup(
        date: DateTime(2026, 1, 27),
        totalIncome: 0.00,
        totalExpense: 0.00,
        items: [
          TransactionItem(
            category: 'Transfer',
            description: 'minimum fees',
            account: 'HIBD → HIBD Travel',
            amount: 80.00,
            icon: Icons.swap_horiz,
            transactionDate: DateTime(2026, 1, 27),
            isIncome: false,
          ),
        ],
      ),
      TransactionGroup(
        date: DateTime(2026, 1, 24),
        totalIncome: 0.00,
        totalExpense: 0.00,
        items: [
          TransactionItem(
            category: 'Transfer',
            description: 'HIBD → House',
            account: '',
            amount: 300.00,
            icon: Icons.swap_horiz,
            transactionDate: DateTime(2026, 1, 24),
            isIncome: false,
          ),
        ],
      ),
      TransactionGroup(
        date: DateTime(2026, 1, 22),
        totalIncome: 245.00,
        totalExpense: 0.00,
        items: [
          TransactionItem(
            category: 'Other',
            description: 'tax refunds',
            account: 'HIBD Debit Card',
            amount: 245.00,
            icon: Icons.attach_money,
            transactionDate: DateTime(2026, 1, 22),
            isIncome: true,
          ),
        ],
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: transactionGroups.length,
      itemBuilder: (context, index) {
        return transactionGroups[index];
      },
    );
  }
}
