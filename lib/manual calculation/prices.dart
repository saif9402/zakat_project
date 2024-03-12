import 'package:flutter/material.dart';
import '../business_logic/first_screen.dart'; // Import the GoldCashScreen

class GoldSilverEntryScreen extends StatefulWidget {
  @override
  _GoldSilverEntryScreenState createState() => _GoldSilverEntryScreenState();
}

class _GoldSilverEntryScreenState extends State<GoldSilverEntryScreen> {
  TextEditingController gold24Controller = TextEditingController();
  TextEditingController gold21Controller = TextEditingController();
  TextEditingController gold18Controller = TextEditingController();
  TextEditingController silverController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  String? gold24ErrorText;
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: gold24Controller,
              decoration: InputDecoration(labelText: 'Gold 24 carat *', errorText: gold24ErrorText),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  gold24ErrorText = value.isEmpty ? 'Please enter gold value' : null;
                });
              },
            ),
            TextFormField(
              controller: gold21Controller,
              decoration: InputDecoration(labelText: 'Gold 21 carat *', errorText: gold21ErrorText),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  gold21ErrorText = value.isEmpty ? 'Please enter gold value' : null;
                });
              },
            ),
            TextFormField(
              controller: gold18Controller,
              decoration: InputDecoration(labelText: 'Gold 18 carat *', errorText: gold18ErrorText),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  gold18ErrorText = value.isEmpty ? 'Please enter gold value' : null;
                });
              },
            ),
            TextFormField(
              controller: silverController,
              decoration: InputDecoration(labelText: 'Silver *', errorText: silverErrorText),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  silverErrorText = value.isEmpty ? 'Please enter silver value' : null;
                });
              },
            ),
            TextFormField(
              controller: currencyController,
              decoration: InputDecoration(labelText: 'Currency *', errorText: currencyErrorText),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  currencyErrorText = value.isEmpty ? 'Please enter currency' : null;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (gold24Controller.text.isEmpty ||
                    gold21Controller.text.isEmpty ||
                    gold18Controller.text.isEmpty ||
                    silverController.text.isEmpty || currencyController.text.isEmpty) {
                  setState(() {
                    gold24ErrorText = gold24Controller.text.isEmpty ? 'Please enter gold value' : null;
                    gold21ErrorText = gold21Controller.text.isEmpty ? 'Please enter gold value' : null;
                    gold18ErrorText = gold18Controller.text.isEmpty ? 'Please enter gold value' : null;
                    silverErrorText = silverController.text.isEmpty ? 'Please enter silver value' : null;
                    currencyErrorText = currencyController.text.isEmpty ? 'Please enter currency' : null;
                  });
                } else {
                  // Navigate to the GoldCashScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoldCashScreen(
                        gold24Price: double.tryParse(gold24Controller.text) ?? 0.0,
                        gold21Price: double.tryParse(gold21Controller.text) ?? 0.0,
                        gold18Price: double.tryParse(gold18Controller.text) ?? 0.0,
                        silverPrice: double.tryParse(silverController.text) ?? 0.0,
                        currency: currencyController.text,
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
    );
  }
}
