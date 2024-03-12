import 'package:flutter/material.dart';
import 'package:my_zakat/database_utils.dart';
import 'package:my_zakat/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../provider/my_user.dart';
import '../provider/user_provider.dart';

Future<double> calculateZakat({
  required double gold24Weight,
  required double gold21Weight,
  required double gold18Weight,
  required double silverWeight,
  required double cash,
  required double gold24Price,
  required double gold21Price,
  required double gold18Price,
  required double silverPrice,
  required double apartments,
  required double investments,
  required double inventory,
  required double debts,
  required String currency,
  required BuildContext context,
  // Add other necessary parameters
}) async {
  // Add your Zakat calculation logic here
  // For example:
  double goldZakat = 0.0;
  double silverZakat = 0.0;
  double cashZakat = 0.0;
  double zakatAmount = 0.0;

  //gold 24 carat:
  bool x = gold24Weight >= 85 ? true : false;
  if(x){
    goldZakat = (gold24Weight * 0.025) * gold24Price;
  }

  //gold 21 carat
  bool y = gold21Weight >= 97 ? true : false;
  if(y){
    goldZakat = (gold21Weight * 0.025) * gold21Price;
  }

  //gold 18 carat
  bool z = gold24Weight >= 85 ? true : false;
  if(z){
    goldZakat = (gold24Weight * 0.025) * gold18Price;
  }

  // silver
  bool a = silverWeight >= 595 ? true : false;
  if(a){
    silverZakat = (silverWeight * 0.025) * silverPrice;
  }

  //cash, investments, apartment, inventory, debts
  double total = cash + apartments + inventory + investments - debts;
  double totalToGold = total / gold24Price;
  bool l = totalToGold >= 85 ? true : false;
  if(l){
    cashZakat = total * 0.025;
  }

  zakatAmount = cashZakat + silverZakat + goldZakat;

  // Update total_zakat
  MyUser? currentUser = Provider.of<UserProvider>(context, listen: false).user;
  if (currentUser != null) {
    double updatedTotalZakat = zakatAmount;
    currentUser.total_zakat = updatedTotalZakat;
    await DataBaseUtils.updateUser(currentUser);
    Provider.of<UserProvider>(context, listen: false).user = currentUser;

  }

  return zakatAmount;
}
