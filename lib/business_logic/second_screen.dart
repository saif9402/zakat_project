import 'package:flutter/material.dart';
import 'package:my_zakat/business_logic/knowledge_base.dart';
class SecondScreen extends StatelessWidget {
  final double goldPrice;
  final double silverPrice;
  final double silverWeight;
  final double goldWeight;
  final double cash;
  final String currency;

  SecondScreen({
    Key? key,
    required this.goldPrice,
    required this.goldWeight,
    required this.cash,
    required this.silverWeight,
    required this.silverPrice,
    required this.currency,
  }) : super(key: key);

  final TextEditingController apartmentsController = TextEditingController();
  final TextEditingController investmentController = TextEditingController();
  final TextEditingController inventoryController = TextEditingController();
  final TextEditingController debtsController = TextEditingController();

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Silver, Investment, Inventory & Debts'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: apartmentsController,
              decoration: InputDecoration(labelText: 'Apartments'),
              keyboardType: TextInputType.number,
              // Add logic to handle silver input
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: investmentController,
              decoration: InputDecoration(labelText: 'Investment'),
              keyboardType: TextInputType.number,
              // Add logic to handle investment input
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: inventoryController,
              decoration: InputDecoration(labelText: 'Inventory'),
              keyboardType: TextInputType.number,
              // Add logic to handle inventory input
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: debtsController,
              decoration: InputDecoration(labelText: 'Debts'),
              keyboardType: TextInputType.number,
              // Add logic to handle debts input
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Add logic to calculate Zakat based on user inputs
                double apart = double.tryParse(apartmentsController.text)??0.0;
                double invent = double.tryParse(inventoryController.text)??0.0;
                double invest = double.tryParse(investmentController.text)??0.0;
                double deb = double.tryParse(debtsController.text)??0.0;

                

                double zakatAmount = await calculateZakat(
                  goldWeight: goldWeight,
                  silverWeight: silverWeight,
                  cash: cash,
                  goldPrice: goldPrice,
                  silverPrice: silverPrice,
                  currency: currency,
                  apartments: apart,
                  inventory: invent,
                  investments: invest,
                  debts: deb,
                  context: context
                );

                // Display zakat amount using a dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Zakat Amount'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Your Zakat amount is $zakatAmount $currency'),
                        SizedBox(height: 8.0),
                        Text('This amount is calculated based on your inputs.'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
