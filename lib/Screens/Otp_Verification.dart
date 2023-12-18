import 'package:flutter/material.dart';
import 'package:mealmates/Screens/Home_Screen.dart';
import 'package:mealmates/main.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';


class Verification extends StatefulWidget {
   Verification();


  //String phoneNumber = Provider.of(context as BuildContext)<PhoneNumberProvider>(context).phoneNumber;

 @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
//String phoneNumber = Provider.of(context)<PhoneNumberProvider>(context).phoneNumber;


    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(192, 192, 192, 70)),
        borderRadius: BorderRadius.circular(17),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(0, 255, 0, 100)),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Consumer<PhoneNumberProvider>(builder:(context,value,child)=>SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                )),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(

                children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/54,),
                  const Text(
                    "We have send the code to",
                    style: TextStyle(
                        fontSize: 20, wordSpacing: 1, fontWeight: FontWeight.w300),
                  ),

                  Text("+91${value.phoneNumber}",style: const TextStyle(fontSize: 15),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),



                  //OTP Input
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
                      },
                      child: const Text("Verifiy"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                            0,
                            255,
                            0,
                            100,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Resend code in")
                    ],
                  )
                ],
              ),
            ),
          ),
        )) );
  }
}

