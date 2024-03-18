import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../business_logic/first_screen.dart';

class PricesDisplayPage extends StatefulWidget {
  @override
  _PricesDisplayPageState createState() => _PricesDisplayPageState();
}

class _PricesDisplayPageState extends State<PricesDisplayPage> {
  final TextEditingController _searchController = TextEditingController();

  List<String> _countryList = [];
  List<String> _filteredCountryList = [];

  String _currencyController = '';
  String _gold24Controller = '';
  String _gold22Controller = '';
  String _gold21Controller = '';
  String _gold18Controller = '';
  String _silverController = '';

  @override
  void initState() {
    super.initState();
    // Set the default value here
    _fetchCountryList();
    _searchController.addListener(() {
      _filterCountryList(_searchController.text);
    });
  }

  Future<void> _fetchCountryList() async {
    FirebaseFirestore.instance.collection('metalPrices').get().then((querySnapshot) {
      final List<String> countries = querySnapshot.docs.map((doc) => doc.id).toList();
      setState(() {
        _countryList = countries;
        _filteredCountryList = countries;
      });
    });
  }

  void _filterCountryList(String enteredKeyword) {
    List<String> results;
    if (enteredKeyword.isEmpty) {
      results = _countryList;
    } else {
      results = _countryList
          .where((country) => country.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredCountryList = results;
    });
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterCountryList,
                decoration: InputDecoration(
                  labelText: Locales.string(context, 'search_country_list'),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCountryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_filteredCountryList[index]),
                    onTap: () async {
                      final docSnapshot = await FirebaseFirestore.instance
                          .collection('metalPrices')
                          .doc(_filteredCountryList[index])
                          .get();
                      final data = docSnapshot.data()!;
                      setState(() {
                        _searchController.text = _filteredCountryList[index];
                        _updatePrices(data);
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _updatePrices(Map<String, dynamic> data) {
    setState(() {
      _currencyController = data['currency'];
      _gold24Controller = data['gold_24'];
      _gold22Controller = data['gold_22'];
      _gold21Controller = data['gold_21'];
      _gold18Controller = data['gold_18'];
      _silverController = data['silver'];
    });
  }

  void _showCountryNotSelectedAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${Locales.string(context, 'alert')}'),
          content: Text('${Locales.string(context, 'please_select_country_from_list')}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(Locales.string(context, 'ok')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.34),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _searchController,
                      readOnly: true,
                      onTap: _showCountryPicker,
                      decoration: InputDecoration(
                        labelText: Locales.string(context, 'search_and_select_country'),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  PriceCard(
                    title: Locales.string(context, "gold_24_per_gram"),
                    price: _gold24Controller,
                    currency: _currencyController,
                    imagePath: 'assets/images/gold_logo.png',
                  ),
                  PriceCard(
                    title: Locales.string(context, "silver_per_gram"),
                    price: _silverController,
                    currency: _currencyController,
                    imagePath: 'assets/images/sliver_logo.png',
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_searchController.text.isEmpty) {
                          _showCountryNotSelectedAlert();
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GoldCashScreen(
                                gold24Price: double.parse(_gold24Controller),
                                silverPrice: double.parse(_silverController),
                                currency: _currencyController,
                              ),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Text(
                        Locales.string(context, "go_to_calculator"),
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class PriceCard extends StatelessWidget {
  final String title;
  final String price;
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
