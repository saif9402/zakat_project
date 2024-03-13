import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../api/api.dart'; // Import the PricesDisplayPage
import '../manual calculation/prices.dart';
class ZakatCalculationMethodScreen extends StatelessWidget {

  static const String routeName = 'choose';

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
                    builder: (context) => GoldSilverEntryScreen(),
                  ),
                );
              },
              child: Text(
                Locales.string(context, 'manual')
              ),
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
              child: Text(
                  Locales.string(context, 'automatic')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
