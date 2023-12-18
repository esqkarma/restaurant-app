

import 'package:flutter/material.dart';
import 'package:mealmates/Screens/Home_Screen.dart';
import 'package:mealmates/Screens/Login_Page.dart';
import 'package:mealmates/Screens/Order_verification.dart';
import 'package:mealmates/Screens/Splash_Screen.dart';
import 'package:mealmates/Screens/profile/Profile.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>PhoneNumberProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:SplashScreen(),
        ),
      );
  }
}

class PhoneNumberProvider extends ChangeNotifier{
  String _phoneNumber='';
  String get phoneNumber => _phoneNumber;
  void setPhoneNumber(String number)
  {
    _phoneNumber = number;
    notifyListeners();
  }
}
