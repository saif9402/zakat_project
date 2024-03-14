import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../business_logic/first_screen.dart'; // Import the GoldCashScreen

class GoldSilverEntryScreen extends StatefulWidget {
  @override
  _GoldSilverEntryScreenState createState() => _GoldSilverEntryScreenState();
}

class _GoldSilverEntryScreenState extends State<GoldSilverEntryScreen> {
  TextEditingController gold24Controller = TextEditingController();
  TextEditingController gold22Controller = TextEditingController();
  TextEditingController gold21Controller = TextEditingController();
  TextEditingController gold18Controller = TextEditingController();
  TextEditingController silverController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  String? gold24ErrorText;
  String? gold22ErrorText;
  String? gold21ErrorText;
  String? gold18ErrorText;
  String? silverErrorText;
  String? currencyErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Gold and Silver'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            // Replace with your actual image file name and path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: gold24Controller,
                  decoration: InputDecoration(
                      labelText: Locales.string(context, 'gold_24'),
                      errorText: gold24ErrorText),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      gold24ErrorText = value.isEmpty
                          ? Locales.string(context, 'please_enter_gold_value')
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: gold22Controller,
                  decoration: InputDecoration(
                      labelText: Locales.string(context, 'gold_22'),
                      errorText: gold22ErrorText),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      gold22ErrorText = value.isEmpty
                          ? Locales.string(context, 'please_enter_gold_value')
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: gold21Controller,
                  decoration: InputDecoration(
                      labelText: Locales.string(context, 'gold_21'),
                      errorText: gold21ErrorText),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      gold21ErrorText = value.isEmpty
                          ? Locales.string(context, 'please_enter_gold_value')
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: gold18Controller,
                  decoration: InputDecoration(
                      labelText: Locales.string(context, 'gold_18'),
                      errorText: gold18ErrorText),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      gold18ErrorText = value.isEmpty
                          ? Locales.string(context, 'please_enter_gold_value')
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: silverController,
                  decoration: InputDecoration(
                      labelText: Locales.string(context, 'silver'),
                      errorText: silverErrorText),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      silverErrorText = value.isEmpty
                          ? Locales.string(context, 'please_enter_silver_value')
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: currencyController,
                  decoration: InputDecoration(
                      labelText: Locales.string(context, 'currency'),
                      errorText: currencyErrorText),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      currencyErrorText = value.isEmpty
                          ? Locales.string(context, 'please_enter_currency')
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (gold24Controller.text.isEmpty ||
                        gold22Controller.text.isEmpty ||
                        gold21Controller.text.isEmpty ||
                        gold18Controller.text.isEmpty ||
                        silverController.text.isEmpty ||
                        currencyController.text.isEmpty) {
                      setState(() {
                        gold24ErrorText = gold24Controller.text.isEmpty
                            ? Locales.string(context, 'please_enter_gold_value')
                            : null;
                        gold21ErrorText = gold21Controller.text.isEmpty
                            ? Locales.string(context, 'please_enter_gold_value')
                            : null;
                        gold18ErrorText = gold18Controller.text.isEmpty
                            ? Locales.string(context, 'please_enter_gold_value')
                            : null;
                        silverErrorText = silverController.text.isEmpty
                            ? Locales.string(
                                context, 'please_enter_silver_value')
                            : null;
                        currencyErrorText = currencyController.text.isEmpty
                            ? Locales.string(context, 'please_enter_currency')
                            : null;
                      });
                    } else {
                      // Navigate to the GoldCashScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoldCashScreen(
                            gold24Price:
                                double.tryParse(gold24Controller.text) ?? 0.0,
                            gold22Price:
                                double.tryParse(gold22Controller.text) ?? 0.0,
                            gold21Price:
                                double.tryParse(gold21Controller.text) ?? 0.0,
                            gold18Price:
                                double.tryParse(gold18Controller.text) ?? 0.0,
                            silverPrice:
                                double.tryParse(silverController.text) ?? 0.0,
                            currency: currencyController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(Locales.string(context, 'next')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
