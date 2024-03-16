import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../home/home_screen.dart';

class ZakatElfitrPage extends StatelessWidget {
  final TextEditingController _familyMembersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Set the height to match screen height
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.34),
                Text(
                  Locales.string(context, 'zakat_elftr'),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Text(
                      Locales.string(context, 'zakat_elfitr_explaination'),
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 26.0),
                Text(
                  Locales.string(context, 'number_of_family'),
                  style: TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 8.0),// Add some space between text and text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _familyMembersController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: Locales.string(context, 'number_of_family'),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // Add some space between text field and button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _calculateZakat(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    ),
                    child: Text(Locales.string(context, 'calculate'), style: TextStyle(color: Colors.white) ,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculateZakat(BuildContext context) {
    // Get the number of family members entered by the user
    int numberOfFamilyMembers = int.tryParse(_familyMembersController.text) ?? 0;
    // Calculate Zakat Elfitr amount
    double zakatAmount = numberOfFamilyMembers * 2.75;

    // Show the result in a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Locales.string(context, 'elfitr_amount')),
          content: Text('${Locales.string(context, 'the_zakat_amount')} $numberOfFamilyMembers ${Locales.string(context, 'familty_members_is')} $zakatAmount ${Locales.string(context, 'kg')}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                );// Close the dialog
              },
              child: Text(Locales.string(context, 'ok')),
            ),
          ],
        );
      },
    );
  }
}
