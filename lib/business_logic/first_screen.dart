import 'package:flutter/material.dart';
import 'second_screen.dart'; // Import the second screen

class GoldCashScreen extends StatefulWidget {
  final double gold24Price;
  final double gold22Price;
  final double gold21Price;
  final double gold18Price;
  final double silverPrice;
  final String currency;

  const GoldCashScreen({
    Key? key,
    required this.gold24Price,
    required this.gold22Price,
    required this.gold21Price,
    required this.gold18Price,
    required this.silverPrice,
    required this.currency,
  }) : super(key: key);
  @override
  _GoldCashScreenState createState() => _GoldCashScreenState();
}

class _GoldCashScreenState extends State<GoldCashScreen> {
  final TextEditingController gold24WeightController = TextEditingController();
  final TextEditingController gold22WeightController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
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
                controller: gold22WeightController,
                decoration: InputDecoration(
                  labelText: 'Gold 22 carat',
                  hintText: 'Enter gold weight (leave empty if not applicable)',
                  helperText: 'Minimum 92 grams',
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: gold21WeightController,
                decoration: InputDecoration(
                  labelText: 'Gold 21 carat',
                  hintText: 'Enter gold weight (leave empty if not applicable)',
                  helperText: 'Minimum 97 grams',
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: gold18WeightController,
                decoration: InputDecoration(
                  labelText: 'Gold 18 carat',
                  hintText: 'Enter gold weight (leave empty if not applicable)',
                  helperText: 'Minimum 113 grams',
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
                  double gold22Weight = double.tryParse(gold22WeightController.text)??0.0;
                  double gold21Weight = double.tryParse(gold21WeightController.text)??0.0;
                  double gold18Weight = double.tryParse(gold18WeightController.text)??0.0;
                  double silverWeight = double.tryParse(silverWeightController.text)??0.0;
                  double cash = double.tryParse(cashController.text)??0.0;

                  // Check conditions to navigate to next screen
                  if (gold24WeightController.text.isEmpty &&
                      gold22WeightController.text.isEmpty &&
                      gold21WeightController.text.isEmpty &&
                      gold18WeightController.text.isEmpty &&
                      silverWeightController.text.isEmpty &&
                      cashController.text.isEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          gold24Price: widget.gold24Price,
                          gold22Price: widget.gold22Price,
                          gold21Price: widget.gold21Price,
                          gold18Price: widget.gold18Price,
                          silverPrice: widget.silverPrice,
                          currency: widget.currency,
                          gold24Weight: 0,
                          gold22Weight: 0,
                          gold21Weight: 0,
                          gold18Weight: 0,
                          silverWeight: 0,
                          cash:0,
                        ),
                      ),
                    );
                  }

                  else if((gold24Weight<85 && gold24WeightController.text.isNotEmpty) ||
                      (gold22Weight<92 && gold22WeightController.text.isNotEmpty) ||
                      (gold21Weight<97 && gold21WeightController.text.isNotEmpty) ||
                      (gold18Weight<113 && gold18WeightController.text.isNotEmpty) ||
                      (silverWeight<595 && silverWeightController.text.isNotEmpty)){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter valid weights.'),
                      ),
                    );
                  }

                  else {
                    // Show an error message if validation fails (optional)

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          gold24Price: widget.gold24Price,
                          gold22Price: widget.gold22Price,
                          gold21Price: widget.gold21Price,
                          gold18Price: widget.gold18Price,
                          silverPrice: widget.silverPrice,
                          currency: widget.currency,
                          gold24Weight: gold24Weight,
                          gold22Weight: gold22Weight,
                          gold21Weight: gold21Weight,
                          gold18Weight: gold18Weight,
                          silverWeight: silverWeight,
                          cash:cash,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
