import 'package:flutter/material.dart';
import 'package:mealmates/Screens/profile/Profile.dart';
import 'package:mealmates/main.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';


import 'Otp_Verification.dart';

class Login_Page extends StatefulWidget {
   Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Center(
            child: Column(

              children: [
                Container
                  (

                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 5,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          child: Image.asset('assets/mealsmate.png')),
                    ))),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("Sign In"
                    , style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(right: 260, top: 50, bottom: 10),
                      child: Text("Contact No", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    SizedBox(
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.15,


                        // Taking Input from User, Phone Number
                        child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),)),
                    const SizedBox(height: 40,),
                    SizedBox(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.25,
                      child: ElevatedButton(onPressed: () {
                        Provider.of<PhoneNumberProvider>(context,listen:false).setPhoneNumber(_phoneNumberController.text);
                        if (_phoneNumberController.length==10)
                          {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Verification()));
                          }
                      }, child: const Text("Sign In",
                        style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}



