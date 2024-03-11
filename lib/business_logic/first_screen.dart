import 'package:flutter/material.dart';
import 'second_screen.dart'; // Import the second screen

class GoldCashScreen extends StatefulWidget {
  final double goldPrice;
  final double silverPrice;
  final String currency;

  const GoldCashScreen({
    Key? key,
    required this.goldPrice,
    required this.silverPrice,
    required this.currency,
  }) : super(key: key);
  @override
  _GoldCashScreenState createState() => _GoldCashScreenState();
}

class _GoldCashScreenState extends State<GoldCashScreen> {
  final TextEditingController gold24WeightController = TextEditingController();
  final TextEditingController gold21WeightController = TextEditingController();
  final TextEditingController gold18WeightController = TextEditingController();
  final TextEditingController silverWeightController = TextEditingController();
  final TextEditingController cashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gold, Silver and Cash'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: gold24WeightController,
              decoration: InputDecoration(
                labelText: 'Gold 24 carat',
                hintText: 'Enter gold weight (leave empty if not applicable)',
                helperText: 'Minimum 85 grams',
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: silverWeightController,
              decoration: InputDecoration(
                labelText: 'Silver',
                hintText: 'Enter silver weight (leave empty if not applicable)',
                helperText: 'Minimum 595 grams',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: cashController,
              decoration: InputDecoration(
                  labelText: 'Cash',
                  hintText: 'Enter cash (leave empty if not applicable)'
              ),

              keyboardType: TextInputType.number,
              // Add logic to handle cash input
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Extract entered values
                double gold24Weight = double.tryParse(gold24WeightController.text)??0.0;
                //double? gold21Weight = double.tryParse(gold21WeightController.text)??0.0;
               // double? gold18Weight = double.tryParse(gold18WeightController.text)??0.0;
                double silverWeight = double.tryParse(silverWeightController.text)??0.0;
                double cash = double.tryParse(cashController.text)??0.0;

                // Check conditions to navigate to next screen
                if (gold24WeightController.text.isEmpty &&
                    silverWeightController.text.isEmpty &&
                    cashController.text.isEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        goldPrice: widget.goldPrice,
                        silverPrice: widget.silverPrice,
                        currency: widget.currency,
                        goldWeight: 0,
                        silverWeight: 0,
                        cash:0,
                      ),
                    ),
                  );
                }

                else if (((silverWeightController.text.isNotEmpty && gold24WeightController.text.isNotEmpty) &&
                    silverWeight>=595 &&
                    gold24Weight>=85) ||
                    (silverWeightController.text.isEmpty && gold24Weight>=85) ||
                    (gold24WeightController.text.isEmpty && silverWeight>=595)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        goldPrice: widget.goldPrice,
                        silverPrice: widget.silverPrice,
                        currency: widget.currency,
                        goldWeight: gold24Weight,
                        silverWeight: silverWeight,
                        cash:cash,
                      ),
                    ),
                  );
                }

                else {
                  // Show an error message if validation fails (optional)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter valid weights.'),
                    ),
                  );
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}