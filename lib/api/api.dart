import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../business_logic/first_screen.dart';

import '../business_logic/first_screen.dart'; // Make sure this import points to where your GoldCashScreen is located.

class PricesDisplayPage extends StatefulWidget {
  @override
  _PricesDisplayPageState createState() => _PricesDisplayPageState();
}

class _PricesDisplayPageState extends State<PricesDisplayPage> {
  String selectedCurrency = 'USD';
  final List<String> currencies = [
    'USD', 'AUD', 'GBP', 'EUR', 'CHF', 'CAD', 'JPY', 'EGP', 'KWD', 'SAR'
  ];
  double gold24PricePerGram = 0.0;
  double gold21PricePerGram = 0.0;
  double gold18PricePerGram = 0.0;
  double silverPricePerGram = 0.0;
  final String apiKey = 'goldapi-1b3ndsltnaidg5-io';

  @override
  void initState() {
    super.initState();
    fetchPrices();
  }

  Future<void> fetchPrices() async {
    await fetchMetalPrice('XAU', (price) => setState(() => gold24PricePerGram = price));
    await fetchMetalPrice('XAG', (price) => setState(() => silverPricePerGram = price));
  }

  Future<void> fetchMetalPrice(String metal, Function(double) onSuccess) async {
    String url = 'https://www.goldapi.io/api/$metal/$selectedCurrency';
    try {
      var response = await http.get(Uri.parse(url), headers: {"x-access-token": apiKey});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        onSuccess(data['price_gram_24k']);
      } else {
        print('Failed to load price for $metal. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching price for $metal: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gold and Silver Prices'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Choose Your Currency',
                ),
                value: selectedCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                    fetchPrices();
                  });
                },
                items: currencies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            PriceCard(
              title: 'Gold 24 carat Price Per Gram',
              price: gold24PricePerGram,
              currency: selectedCurrency,
              imagePath: 'assets/images/gold_logo.png',
            ),
            PriceCard(
              title: 'Gold 21 carat Price Per Gram',
              price: gold21PricePerGram,
              currency: selectedCurrency,
              imagePath: 'assets/images/gold_logo.png',
            ),
            PriceCard(
              title: 'Gold 18 carat Price Per Gram',
              price: gold18PricePerGram,
              currency: selectedCurrency,
              imagePath: 'assets/images/gold_logo.png',
            ),
            PriceCard(
              title: 'Silver Price Per Gram',
              price: silverPricePerGram,
              currency: selectedCurrency,
              imagePath: 'assets/images/sliver_logo.png',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GoldCashScreen(
                      gold24Price: gold24PricePerGram,
                      gold21Price: gold21PricePerGram,
                      gold18Price: gold18PricePerGram,
                      silverPrice: silverPricePerGram,
                      currency: selectedCurrency,
                    ),
                  ),
                );
              },
              child: Text('Go to Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String title;
  final double price;
  final String currency;
  final String imagePath;

  const PriceCard({
    Key? key,
    required this.title,
    required this.price,
    required this.currency,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(imagePath, width: 40),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("$price $currency", style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
      ),
    );
  }
}
