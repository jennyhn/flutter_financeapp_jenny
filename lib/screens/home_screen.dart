import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intl/intl.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    final currentMonth = DateFormat('MMMM yyyy').format(DateTime.now());

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Finance Mate'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded, size: 28),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur Akun belum tersedia')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==== Judul Kartu ====
            const Text(
              'My Cards',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ==== Kartu Bank ====
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank Mandiri',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Colors.deepPurple,
                    color2: Colors.pinkAccent,
                  ),
                  AtmCard(
                    bankName: 'Bank BCA',
                    cardNumber: '**** 8765',
                    balance: 'Rp2.000.000',
                    color1: Colors.pinkAccent,
                    color2: Colors.deepPurple,
                  ),
                  AtmCard(
                    bankName: 'Bank BRI',
                    cardNumber: '**** 8754',
                    balance: 'Rp5.000.000',
                    color1: Colors.deepPurple,
                    color2: Colors.pinkAccent,
                  ),
                  AtmCard(
                    bankName: 'Bank BJB',
                    cardNumber: '**** 8759',
                    balance: 'Rp500.000',
                    color1: Colors.deepPurple,
                    color2: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==== Header Bulan ====
            Center(
              child: Text(
                'Expenditure $currentMonth',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ==== Grid Menu (Progress Lingkaran) ====
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(
                  icon: Icons.health_and_safety,
                  label: 'Health',
                  progress: 0.5,
                ),
                GridMenuItem(
                  icon: Icons.travel_explore,
                  label: 'Travel',
                  progress: 0.2,
                ),
                GridMenuItem(
                  icon: Icons.fastfood,
                  label: 'Food',
                  progress: 0.8,
                ),
                GridMenuItem(icon: Icons.event, label: 'Event', progress: 0.3),
              ],
            ),
            const SizedBox(height: 20),

            // ==== Transaksi Terbaru ====
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),

      // ==== Bottom Navigation Bar ====
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple,
        buttonBackgroundColor: Colors.purpleAccent,
        height: 60,
        index: _page,
        animationDuration: const Duration(milliseconds: 400),
        animationCurve: Curves.easeInOut,
        items: const <Widget>[
          Icon(Icons.home, color: Colors.white, size: 28),
          Icon(Icons.bar_chart, color: Colors.white, size: 28),
          Icon(Icons.account_circle, color: Colors.white, size: 28),
          Icon(Icons.settings, color: Colors.white, size: 28),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
