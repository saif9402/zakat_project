import 'package:flutter/material.dart';

class GoldCalculatorPage extends StatefulWidget {
  final double goldPrice;
  final double silverPrice;
  final String currency;

  const GoldCalculatorPage({
    Key? key,
    required this.goldPrice,
    required this.silverPrice,
    required this.currency,
  }) : super(key: key);

  @override
  _GoldCalculatorPageState createState() => _GoldCalculatorPageState();
}

class _GoldCalculatorPageState extends State<GoldCalculatorPage> {
  final TextEditingController _goldController = TextEditingController();
  final TextEditingController _silverController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();
  String _result = '';
  double _totalZakat = 0.0; // Variable for total zakat

  @override
  void dispose() {
    _goldController.dispose();
    _silverController.dispose();
    _moneyController.dispose();
    super.dispose();
  }

  void _calculateZakat() {
    double goldInGrams = double.tryParse(_goldController.text) ?? 0;
    double silverInGrams = double.tryParse(_silverController.text) ?? 0;
    double money = double.tryParse(_moneyController.text) ?? 0;
    double goldZakat = 0;
    double silverZakat = 0;
    double moneyZakat = 0;

    if (goldInGrams >= 85) {
      goldZakat = goldInGrams * widget.goldPrice * 0.025;
    }
    if (silverInGrams >= 595) {
      silverZakat = silverInGrams * widget.silverPrice * 0.025;
    }
    double moneyInGoldGrams = money / widget.goldPrice;
    if (moneyInGoldGrams >= 85) {
      moneyZakat = money * 0.025;
    }

    _totalZakat = goldZakat + silverZakat + moneyZakat; // Calculate total zakat

    setState(() {
      _result = 'Gold Zakat: ${widget.currency}${goldZakat.toStringAsFixed(2)}\n'
          'Silver Zakat: ${widget.currency}${silverZakat.toStringAsFixed(2)}\n'
          'Money Zakat: ${widget.currency}${moneyZakat.toStringAsFixed(2)}\n'
          'Total Zakat: ${widget.currency}${_totalZakat.toStringAsFixed(2)}'; // Add total zakat to the result string
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zakat Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _goldController,
              decoration: const InputDecoration(
                labelText: 'Gold amount in grams',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _silverController,
              decoration: const InputDecoration(
                labelText: 'Silver amount in grams',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _moneyController,
              decoration: const InputDecoration(
                labelText: 'Money amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateZakat,
              child: const Text('Calculate Zakat'),
            ),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
