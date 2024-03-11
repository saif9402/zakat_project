import 'package:flutter/material.dart';
import 'package:my_zakat/database_utils.dart';
import 'package:my_zakat/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../provider/my_user.dart';
import '../provider/user_provider.dart';

Future<double> calculateZakat({
  required double goldWeight,
  required double silverWeight,
  required double cash,
  required double goldPrice,
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

  //gold:
  bool x = goldWeight >= 85 ? true : false;
  if(x){
    goldZakat = (goldWeight * 0.025) * goldPrice;
  }

  // silver
  bool a = silverWeight >= 595 ? true : false;
  if(a){
    silverZakat = (silverWeight * 0.025) * silverPrice;
  }

  //cash, investments, apartment, inventory, debts
  double total = cash + apartments + inventory + investments - debts;
  double totalToGold = total / goldPrice;
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
