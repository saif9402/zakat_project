import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //resizeToAvoidBottomInset: false, // Prevent the Scaffold from resizing when the keyboard appears
      // appBar: AppBar(
      //   title: Text('Gold, Silver'),
      // ),
      body: SingleChildScrollView(
        child:
          Container(
            height: MediaQuery.of(context).size.height, // Set height to screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'), // Replace 'assets/background_image.jpg' with your image asset path
                fit: BoxFit.cover,
              ),
            ),

          child : Padding(
            // shrinkWrap: true,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.33),
                    Text(
                      'Enter gold and silver weights in grams:',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: gold24WeightController,
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'gold_24_2'),
                              labelStyle: TextStyle(color: Colors.black),
                              // Set label text color to white
                              // errorText: gold24ErrorText,
                              errorBorder: OutlineInputBorder( // Remove error border to eliminate the horizontal line
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              //prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // hintText: 'Enter gold weight (leave empty if not applicable)',
                              helperText: Locales.string(context, 'minimum_85_gram'),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: gold22WeightController,
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'gold_22_2'),
                              labelStyle: TextStyle(color: Colors.black),
                              // Set label text color to white
                              // errorText: gold24ErrorText,
                              errorBorder: OutlineInputBorder( // Remove error border to eliminate the horizontal line
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              //prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // hintText: 'Enter gold weight (leave empty if not applicable)',
                              helperText: Locales.string(context, 'minimum_92_gram'),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: gold21WeightController,
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'gold_21_2'),
                              labelStyle: TextStyle(color: Colors.black),
                              // Set label text color to white
                              // errorText: gold24ErrorText,
                              errorBorder: OutlineInputBorder( // Remove error border to eliminate the horizontal line
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              //prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // hintText: 'Enter gold weight (leave empty if not applicable)',
                              helperText: Locales.string(context, 'minimum_97_gram'),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          child: TextFormField(
                            controller: gold18WeightController,
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'gold_18_2'),
                              labelStyle: TextStyle(color: Colors.black),
                              // Set label text color to white
                              // errorText: gold24ErrorText,
                              errorBorder: OutlineInputBorder( // Remove error border to eliminate the horizontal line
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              //prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // hintText: 'Enter gold weight (leave empty if not applicable)',
                              helperText: Locales.string(context, 'minimum_113_gram'),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: silverWeightController,
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'silver_2'),
                              labelStyle: TextStyle(color: Colors.black),
                              // Set label text color to white
                              // errorText: gold24ErrorText,
                              errorBorder: OutlineInputBorder( // Remove error border to eliminate the horizontal line
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              //prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // hintText: 'Enter silver weight (leave empty if not applicable)',
                              helperText: Locales.string(context, 'minimum_595_gram'),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0),
                    Center(
                       child: ElevatedButton(
                          onPressed: () {
                            // Extract entered values
                            double gold24Weight = double.tryParse(gold24WeightController.text) ?? 0.0;
                            double gold22Weight = double.tryParse(gold22WeightController.text) ?? 0.0;
                            double gold21Weight = double.tryParse(gold21WeightController.text) ?? 0.0;
                            double gold18Weight = double.tryParse(gold18WeightController.text) ?? 0.0;
                            double silverWeight = double.tryParse(silverWeightController.text) ?? 0.0;

                            // Check conditions to navigate to the next screen
                            if (gold24WeightController.text.isEmpty &&
                                gold22WeightController.text.isEmpty &&
                                gold21WeightController.text.isEmpty &&
                                gold18WeightController.text.isEmpty &&
                                silverWeightController.text.isEmpty) {
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
                                  ),
                                ),
                              );
                            } else if ((gold24Weight < 85 && gold24WeightController.text.isNotEmpty) ||
                                (gold22Weight < 92 && gold22WeightController.text.isNotEmpty) ||
                                (gold21Weight < 97 && gold21WeightController.text.isNotEmpty) ||
                                (gold18Weight < 113 && gold18WeightController.text.isNotEmpty) ||
                                (silverWeight < 595 && silverWeightController.text.isNotEmpty)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(Locales.string(context, 'please_enter_valid_weight')),
                                ),
                              );
                            } else {
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
                                  ),
                                ),
                              );
                            }
                          },
                         style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                           foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                         ),
                          child: Text(Locales.string(context, 'next'), style: TextStyle(color: Colors.white),),
                        ),
                    ),
                  ],
                ),

          ),
          ),
      ),
    );
  }
}
