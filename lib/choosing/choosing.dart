import 'package:flutter/material.dart';
import '../api/api.dart'; // Import the PricesDisplayPage

class ZakatCalculationMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Calculation Method'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the PricesDisplayPage for manual calculation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PricesDisplayPage(),
                  ),
                );
              },
              child: Text('Manual Calculation'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the PricesDisplayPage for automatic calculation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PricesDisplayPage(),
                  ),
                );
              },
              child: Text('Automatic Calculation'),
            ),
          ],
        ),
      ),
    );
  }
}
