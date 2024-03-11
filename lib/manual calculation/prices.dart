import 'package:flutter/material.dart';
import '../business_logic/first_screen.dart'; // Import the GoldCashScreen

class GoldSilverEntryScreen extends StatefulWidget {
  @override
  _GoldSilverEntryScreenState createState() => _GoldSilverEntryScreenState();
}

class _GoldSilverEntryScreenState extends State<GoldSilverEntryScreen> {
  TextEditingController goldController = TextEditingController();
  TextEditingController silverController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  String? goldErrorText;
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
              controller: goldController,
              decoration: InputDecoration(labelText: 'Gold *', errorText: goldErrorText),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  goldErrorText = value.isEmpty ? 'Please enter gold value' : null;
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
                if (goldController.text.isEmpty || silverController.text.isEmpty || currencyController.text.isEmpty) {
                  setState(() {
                    goldErrorText = goldController.text.isEmpty ? 'Please enter gold value' : null;
                    silverErrorText = silverController.text.isEmpty ? 'Please enter silver value' : null;
                    currencyErrorText = currencyController.text.isEmpty ? 'Please enter currency' : null;
                  });
                } else {
                  // Navigate to the GoldCashScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoldCashScreen(
                        goldPrice: double.tryParse(goldController.text) ?? 0.0,
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
