import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_zakat/provider/user_provider.dart';
import 'package:my_zakat/register/register_screen.dart';
import 'package:provider/provider.dart';
import 'choosing/choosing.dart';
import 'home/home_screen.dart';
import 'language/language.dart';
import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Locales.init(['en', 'ar']);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ], child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LanguageScreen.routeName:(_)=>LanguageScreen(),
          RegisterScreen.routeName:(_)=>RegisterScreen(),
          LoginScreen.routeName:(_)=>LoginScreen(),
          HomeScreen.routeName:(_)=>HomeScreen(),
        },
        initialRoute:userProvider.firebaseUser ==null? LanguageScreen.routeName:
        HomeScreen.routeName,
        title: 'zakat-calculator',
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
      ),
    );
  }
}
