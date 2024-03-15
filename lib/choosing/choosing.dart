import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../api/api.dart'; // Import the PricesDisplayPage
import '../manual calculation/prices.dart';

class ZakatCalculationMethodScreen extends StatelessWidget {
  static const String routeName = 'choose';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Locales.string(context, 'choose_calculation_method'), // Add your text here
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to white
                ),
              ),
              SizedBox(height: 30.0),
              Row(
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    ),
                    child: Text(
                      Locales.string(context, 'manual'),
                      style: TextStyle(color: Colors.white), // Set text color to white
                    ),
                  ),
                  SizedBox(width: 16.0),
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    ),
                    child: Text(
                      Locales.string(context, 'automatic'),
                      style: TextStyle(color: Colors.white), // Set text color to white
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
