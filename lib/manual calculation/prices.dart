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
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, MediaQuery.of(context).padding.top + 260.0 , 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter gold and silver prices',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),


                Row(
                  children: [

                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black54,
                        //     width: 3.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     12.0,
                        //   ),
                        // ),
                        child: TextFormField(
                          controller: gold24Controller,
                          decoration: InputDecoration(
                            labelText: Locales.string(context, 'gold_24'),
                            labelStyle: TextStyle(color: Colors.black),
                            // Set label text color to white
                            errorText: gold24ErrorText,
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
                          ),
                          style: TextStyle(color: Colors.black),
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
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black54,
                        //     width: 3.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     12.0,
                        //   ),
                        // ),
                        child: TextFormField(
                          controller: gold22Controller,
                          decoration: InputDecoration(
                            labelText: Locales.string(context, 'gold_22'),
                            labelStyle: TextStyle(color: Colors.black),
                            // Set label text color to white
                            errorText: gold22ErrorText,
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
                          ),
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
                    ),
                  ],
                ),

                SizedBox(height: 10.0),
                // Repeat the Row with the other text fields
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black54,
                        //     width: 3.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     12.0,
                        //   ),
                        // ),
                        child: TextFormField(
                          controller: gold21Controller,
                          decoration: InputDecoration(
                            labelText: Locales.string(context, 'gold_21'),
                            labelStyle: TextStyle(color: Colors.black),
                            // Set label text color to white
                            errorText: gold21ErrorText,
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
                          ),
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
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black54,
                        //     width: 3.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     12.0,
                        //   ),
                        // ),
                        child: TextFormField(
                          controller: gold18Controller,
                          decoration: InputDecoration(
                            labelText: Locales.string(context, 'gold_18'),
                            labelStyle: TextStyle(color: Colors.black),
                            // Set label text color to white
                            errorText: gold18ErrorText,
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
                          ),
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
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black54,
                        //     width: 3.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     12.0,
                        //   ),
                        // ),
                        child: TextFormField(
                          controller: silverController,
                          decoration: InputDecoration(
                            labelText: Locales.string(context, 'silver'),
                            labelStyle: TextStyle(color: Colors.black),
                            // Set label text color to white
                            errorText: silverErrorText,
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
                          ),
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
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: Colors.black54,
                        //     width: 3.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     12.0,
                        //   ),
                        // ),
                        child: TextFormField(
                          controller: currencyController,
                          decoration: InputDecoration(
                            labelText: Locales.string(context, 'currency'),
                            labelStyle: TextStyle(color: Colors.black),
                            // Set label text color to white
                            errorText: currencyErrorText,
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
                          ),
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
                    ),
                  ],
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
                          gold22ErrorText = gold22Controller.text.isEmpty
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
                              gold24Price: double.tryParse(gold24Controller.text) ?? 0.0,
                              gold22Price: double.tryParse(gold22Controller.text) ?? 0.0,
                              gold21Price: double.tryParse(gold21Controller.text) ?? 0.0,
                              gold18Price: double.tryParse(gold18Controller.text) ?? 0.0,
                              silverPrice: double.tryParse(silverController.text) ?? 0.0,
                              currency: currencyController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    ),
                    child: Text(
                      Locales.string(context, 'next'),
                      style: TextStyle(color: Colors.white), // Set text color to white
                    ),
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
