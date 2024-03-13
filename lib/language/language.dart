import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../login/login_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  static const String routeName = 'Language';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> locales = [
    "English",
    "العربیة"
  ];

  List<String> localeCodes = [
    "en",
    "ar"
  ];

  int currentIndex = 0;

  void switchLocale(int index) {
    setState(() {
      currentIndex = index;
    });
    Locales.change(context, localeCodes[currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'), // Change path to your image file
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                SizedBox(height: 90),
                Text(
                  'Discover the importance and           \nprinciples of zakat           ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Select language:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    ElevatedButton(
                      onPressed: () => switchLocale(0),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        child: Column(
                          children: [
                            Icon(Icons.language, color: Colors.white),
                            SizedBox(height: 8),
                            Text(
                              'English',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => switchLocale(1),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        child: Column(
                          children: [
                            Icon(Icons.language, color: Colors.white),
                            SizedBox(height: 8),
                            Text(
                              'العربية',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 16,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
