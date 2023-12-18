import 'package:flutter/material.dart';
import 'package:mealmates/Screens/DummyScreen.dart';
import 'package:mealmates/Screens/Home_Screen.dart';
import 'package:mealmates/main.dart';
import 'package:provider/provider.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});



  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {


  @override
  Widget build(BuildContext context) {
    final int index;
    List<TextStyle> textStyles=[
      //for User Name and Phone Number
     TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      //For List Widget
       TextStyle(
      color: Colors.black,
      fontSize: 17,
      )

    ];
    List<Icon> icons=[
      Icon(Icons.home),
      Icon(Icons.person),
      Icon(Icons.file_copy),
      Icon(Icons.history),
      Icon(Icons.wallet),
      Icon(Icons.monetization_on),
      Icon(Icons.settings),
      Icon(Icons.logout),
    ];
    List<Text> str=[
      Text("Home",style: textStyles[1],),
      Text("My Profile"),
      Text("Documents"),
      Text("History"),
      Text("Wallet"),
      Text("Withdraw"),
      Text("Setting"),
      Text("Logout"),

    ];
   List<dynamic>navigation=[
     Home(),
     Mypro(),
     Docc(),
     History(),
     Wallet(),
     Home(),
     Home(),
     Home(),
    ];

    return Consumer<PhoneNumberProvider>(builder: (context,value,child)=>SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop(context);
        }, icon: Icon(Icons.arrow_back),color: Colors.black,),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Profile",style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(

          children: [
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Container(
              width: MediaQuery.of(context).size.width/1.1,
              height: MediaQuery.of(context).size.height/4.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0.2,
                    )
                  ],
                  color: Colors.white
              ),
              child: Row(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(200,200, 200,80 ),
                        radius: 75,
                        child: Icon(Icons.person,size: 130,color: Colors.black12,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Samir sahoo",style: textStyles[0]),
                        Text(value.phoneNumber,style: textStyles[0])
                      ],
                    ),
                  )
                ],
              ),
            ),
           SizedBox(height: 20,),
           //By using using loop we can save more time
           for( int i=0;i<icons.length;i++)
             Padding(
                 padding: const EdgeInsets.only(left: 10,top: 5),
                 child: ListTile(
                   title: str[i],
                   leading: icons[i],
                   onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>navigation[i]));
                   },

                 ),
               ),

          ],
        ),
      ),
    )));
  }

}

