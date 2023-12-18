import 'package:flutter/material.dart';
import 'package:mealmates/Screens/Login_Page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1200),
            () {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login_Page()), (route) => false);});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/1.5,
              child: Image.asset('assets/mealsmate.png')),
        ),
      ),
    );
  }
}

