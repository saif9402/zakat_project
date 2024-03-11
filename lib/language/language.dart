import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import '../login/login_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  static const String routeName = 'Language';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List locales = [
    "English",
    "العربی"
  ];

  List localeCodes = [
    "en",
    "ar"
  ];

  int currentIndex = 0;

  bool selectedLocale = false;

  void navigateToLoginScreen() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: locales.length,
                  itemBuilder: (context,index){
                    selectedLocale = currentIndex == index;
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 59, 129, 214),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: ListTile(
                        onTap: (){
                          setState(() {
                            currentIndex = index;
                          });
                          Locales.change(context, localeCodes[currentIndex]);
                        },
                        leading: Icon(selectedLocale? Icons.check : Icons.language,color: Colors.white,),
                        title: Text(locales[index],style: const TextStyle(color: Colors.white),),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.white,),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Color.fromARGB(255, 59, 129, 214)),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              child: Text(
                Locales.string(context, 'get_started'),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
