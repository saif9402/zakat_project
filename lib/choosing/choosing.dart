import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../api/api.dart'; // Import the PricesDisplayPage
import '../manual calculation/prices.dart';

class ZakatCalculationMethodScreen extends StatefulWidget {
  static const String routeName = 'choose';

  @override
  _ZakatCalculationMethodScreenState createState() =>
      _ZakatCalculationMethodScreenState();
}

class _ZakatCalculationMethodScreenState
    extends State<ZakatCalculationMethodScreen> {
  bool manualButtonPressed = false;
  bool automaticButtonPressed = false;
  final Color buttonColor = Color.fromARGB(255, 22, 92, 177);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            // Replace with your actual image file name and path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Text(
                    Locales.string(context, 'choose_calculation_method'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 60.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue), // Set the background color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set the text color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                  ),
                  onPressed: () {
                    setState(() {
                      manualButtonPressed = true;
                      automaticButtonPressed = false;
                    });
                    // Navigate to the PricesDisplayPage for manual calculation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoldSilverEntryScreen(),
                      ),
                    );
                  },
                  child: Text(Locales.string(context, 'manual')),
                ),
              ),
              SizedBox(height : 25.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Set the background color
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Set the text color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    automaticButtonPressed = true;
                    manualButtonPressed = false;
                  });
                  // Navigate to the PricesDisplayPage for automatic calculation
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PricesDisplayPage(),
                    ),
                  );
                },
                child: Text(Locales.string(context, 'automatic')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
