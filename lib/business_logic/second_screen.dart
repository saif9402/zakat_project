import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:my_zakat/business_logic/knowledge_base.dart';

import '../home/home_screen.dart';
class SecondScreen extends StatelessWidget {
  final double gold24Price;
  final double gold22Price;
  final double gold21Price;
  final double gold18Price;
  final double silverPrice;
  final double silverWeight;
  final double gold24Weight;
  final double gold22Weight;
  final double gold21Weight;
  final double gold18Weight;
  final String currency;

  SecondScreen({
    Key? key,
    required this.gold24Price,
    required this.gold22Price,
    required this.gold21Price,
    required this.gold18Price,
    required this.gold24Weight,
    required this.gold22Weight,
    required this.gold21Weight,
    required this.gold18Weight,
    required this.silverWeight,
    required this.silverPrice,
    required this.currency,
  }) : super(key: key);

  final TextEditingController apartmentsController = TextEditingController();
  final TextEditingController investmentController = TextEditingController();
  final TextEditingController inventoryController = TextEditingController();
  final TextEditingController debtsController = TextEditingController();
  final TextEditingController cashController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.36),
            Text(
              'Enter money details:',
              style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: cashController,
                    decoration: InputDecoration(
                      labelText: Locales.string(context, 'cash'),
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
                    ),
                    keyboardType: TextInputType.number,
                    // Add logic to handle cash input
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: apartmentsController,
                    decoration: InputDecoration(
                        labelText: Locales.string(context, 'apartments'),
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
                      ),),
                    keyboardType: TextInputType.number,
                    // Add logic to handle silver input
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: investmentController,
                    decoration: InputDecoration(
                        labelText: Locales.string(context, 'investment'),
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
                      ),),
                    keyboardType: TextInputType.number,
                    // Add logic to handle investment input
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: inventoryController,
                    decoration: InputDecoration(
                        labelText: Locales.string(context, 'inventory'),
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
                      ),),
                    keyboardType: TextInputType.number,
                    // Add logic to handle inventory input
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: debtsController,
                    decoration: InputDecoration(
                        labelText: Locales.string(context, 'Debts'),
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
                      ),),
                    keyboardType: TextInputType.number,
                    // Add logic to handle debts input
                  ),
                ),

              ],
            ),
            SizedBox(height: 16.0),
            Center(
            child: ElevatedButton(
              onPressed: () async {
                // Add logic to calculate Zakat based on user inputs
                double apart = double.tryParse(apartmentsController.text) ??
                    0.0;
                double invent = double.tryParse(inventoryController.text) ??
                    0.0;
                double invest = double.tryParse(investmentController.text) ??
                    0.0;
                double deb = double.tryParse(debtsController.text) ?? 0.0;
                double cash = double.tryParse(cashController.text) ?? 0.0;

                double zakatAmount = await calculateZakat(
                    gold24Weight: gold24Weight,
                    gold22Weight: gold22Weight,
                    gold21Weight: gold21Weight,
                    gold18Weight: gold18Weight,
                    silverWeight: silverWeight,
                    cash: cash,
                    gold24Price: gold24Price,
                    gold22Price: gold22Price,
                    gold21Price: gold21Price,
                    gold18Price: gold18Price,
                    silverPrice: silverPrice,
                    currency: currency,
                    apartments: apart,
                    inventory: invent,
                    investments: invest,
                    debts: deb,
                    context: context
                );

                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text(Locales.string(context, 'zakat_amount')),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${Locales.string(context,
                                'your_zakat_amount_is')} $zakatAmount $currency'),
                            SizedBox(height: 8.0),
                            Text(Locales.string(context, 'this_amount')),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                            child: Text(Locales.string(context, 'ok')),
                          ),
                        ],
                      ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
              ),
              child: Text(Locales.string(context, 'calculate'), style: TextStyle(color: Colors.white),),
            ),
            )
          ],
        ),
      ),
    );
  }
}
