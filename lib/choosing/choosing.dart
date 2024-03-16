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
                    backgroundColor:
                    MaterialStateProperty.all<Color>(buttonColor),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(left: 100.0,right: 100),
                    ),
                    elevation: MaterialStateProperty.all<double>(5.0), // Add elevation
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Add border radius
                        side: BorderSide(color: Colors.blue), // Add border color
                      ),
                    ),
                    shadowColor: MaterialStateProperty.all<Color>(
                      Colors.grey.withOpacity(0.5), // Add shadow color
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
                  backgroundColor:
                  MaterialStateProperty.all<Color>(buttonColor),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(left: 92.0,right: 92.0),
                  ),
                  elevation: MaterialStateProperty.all<double>(5.0), // Add elevation
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Add border radius
                      side: BorderSide(color: Colors.blue), // Add border color
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5), // Add shadow color
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
