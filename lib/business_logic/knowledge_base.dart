import 'package:flutter/material.dart';
import 'package:my_zakat/database_utils.dart';
import 'package:my_zakat/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../provider/my_user.dart';
import '../provider/user_provider.dart';

Future<double> calculateZakat({
  required double gold24Weight,
  required double gold22Weight,
  required double gold21Weight,
  required double gold18Weight,
  required double silverWeight,
  required double cash,
  required double gold24Price,
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
  double zakatAmount = 0.0;
  double totalGold24Weight = ((gold24Weight * 24.0) +
      (gold21Weight * 21.0) +
      (gold22Weight * 22.0) +
      (gold18Weight * 18.0)) / 24.0;
  double silverToGold24 = (silverWeight * silverPrice) / gold24Price;
  double cashToGold24 = (cash + apartments + inventory + investments)/gold24Price;
  totalGold24Weight += silverToGold24 + cashToGold24;
  double totalAfterDebts = totalGold24Weight - (debts/gold24Price);

  if(totalAfterDebts >= 85.0){
    zakatAmount = totalAfterDebts * gold24Price * 0.025;
  }



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
