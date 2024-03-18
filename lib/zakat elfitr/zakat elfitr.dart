import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../home/home_screen.dart'; // Ensure this path is correct for your HomeScreen.

class ZakatElfitrPage extends StatefulWidget {
  @override
  _ZakatElfitrPageState createState() => _ZakatElfitrPageState();
}

class _ZakatElfitrPageState extends State<ZakatElfitrPage> {
  final TextEditingController _familyMembersController = TextEditingController();
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Use test ad unit ID for development
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isBannerAdReady = true),
        onAdFailedToLoad: (ad, error) {
          print('Ad failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void _calculateZakat(BuildContext context) {
    int numberOfFamilyMembers = int.tryParse(_familyMembersController.text) ?? 0;
    double zakatAmount = numberOfFamilyMembers * 2.75;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Locales.string(context, 'elfitr_amount')),
          content: Text('''
${Locales.string(context, 'the_zakat_amount')} $numberOfFamilyMembers 
${Locales.string(context, 'family_members_is')} $zakatAmount ${Locales.string(context, 'kg')}.'''),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
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
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.34),
                LocaleText('zakat_elftr', style: TextStyle(fontSize: 20, color: Colors.black)),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LocaleText('zakat_elfitr_explaination', style: TextStyle(fontSize: 13, color: Colors.black)),
                ),
                SizedBox(height: 26.0),
                LocaleText('number_of_family', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(height: 8.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () => _calculateZakat(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: LocaleText('calculate', style: TextStyle(color: Colors.white)),
                  ),
                ),
                if (_isBannerAdReady)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
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
