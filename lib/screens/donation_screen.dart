import 'package:flutter/material.dart';
import '../nav/bottom_navbar.dart';

class DonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate to the Church'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Support the Church',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select or Enter Donation Amount:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDonationButton(context, '\$10'),
                buildDonationButton(context, '\$25'),
                buildDonationButton(context, '\$50'),
                buildDonationButton(context, 'Other'),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Custom Amount',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Choose Payment Method:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.credit_card, size: 36, color: Colors.blue),
                  onPressed: () {
                    // Handle Credit Card payment method
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_balance,
                      size: 36, color: Colors.green),
                  onPressed: () {
                    // Handle Bank Transfer payment method
                  },
                ),
                IconButton(
                  icon: Icon(Icons.paypal, size: 36, color: Colors.lightBlue),
                  onPressed: () {
                    // Handle PayPal payment method
                  },
                ),
                IconButton(
                  icon: Icon(Icons.apple, size: 36, color: Colors.black),
                  onPressed: () {
                    // Handle Apple Pay payment method
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the donation submission
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF93741b), // Matches the common color theme
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Donate Now'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          CommonBottomNavBar(currentIndex: 2), // 2 for Donation
    );
  }

  Widget buildDonationButton(BuildContext context, String amount) {
    return ElevatedButton(
      onPressed: () {
        // Handle the pre-set amount selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      child: Text(amount, style: TextStyle(color: Colors.black87)),
    );
  }
}
