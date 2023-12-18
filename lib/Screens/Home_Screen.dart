import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mealmates/Screens/Order_verification.dart';
import 'package:mealmates/Screens/profile/Profile.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _isSwitched = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    //String phoneNumber = Provider.of(context)<PhoneNumberProvider>(context).phoneNumber;
    TabController controller = TabController(length: 3, vsync: this);
    return Consumer<PhoneNumberProvider>(
        builder: (context, value, child) => SafeArea(
            child: Scaffold(
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromRGBO(0, 100, 0, 0.3),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height,
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset('assets/mealsmate.png')),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2),
                            Align(
                              alignment: Alignment.center,
                              child: Switch(
                                  activeColor: Colors.green,
                                  value: _isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      _isSwitched = value;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Container(
                        height: 35,
                        child: TabBar(
                            unselectedLabelColor: Colors.grey,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.green),
                            controller: controller,
                            tabs: [
                              Tab(
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.green, width: 1)),
                                      child: const Center(
                                        child: Text(
                                          "New Order",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ))),
                              Tab(
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.green, width: 1)),
                                      child: const Center(
                                        child: Text(
                                          "Processing",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ))),
                              Tab(
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.green, width: 1)),
                                      child: const Center(
                                        child: Text(
                                          "Completed",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      )))
                            ]),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: TabBarView(controller: controller, children: [
                          //New order tab
                          Tab(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0, 0),
                                      blurRadius: 3,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, top: 10),
                                        child: Text(
                                          "Order",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      //Order ID
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          "#694",
                                          style: Style(),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          '${date.day}-${date.month}-${date.year}',
                                          style: Style(),
                                        ),
                                      )
                                    ],
                                  ),
                                  //User Details
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text("Name :" + "Samir Sahoo",
                                        style: Style()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 17),
                                    child: Text(
                                      " Contact No :" + value.phoneNumber,
                                      style: Style(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text("Total Amount :Rs. 350.00",
                                        style: Style()),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Accept"),
                                        style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                            backgroundColor: Colors.green,
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {

                                          },
                                          child: Text("Cancel"),

                                        style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: Colors.grey,
                                        ),),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Decline"),

                                        style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: Colors.red,
                                        ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                          //Processing Tab
                          Tab(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3.8,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0, 0),
                                      blurRadius: 3,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: const Center(
                                child: Text("PROCESSING"),
                              ),
                            ),
                          ),

                          //Completed Tab
                          Tab(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3.8,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0, 0),
                                      blurRadius: 3,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: const Center(
                                child: Text("COMPLETED"),
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: NavigationBar(
                    onDestinationSelected: (index) => setState(() {
                          this.index = index;
                        }),
                    selectedIndex: index,
                    height: 70,
                    indicatorColor: Colors.green,
                    destinations: [
                      //main home Screen
                      const NavigationDestination(
                          icon: Icon(Icons.list_alt_outlined), label: 'Order'),

                      //Food menu page
                       NavigationDestination(
                          icon: IconButton(onPressed:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Menu()));
                          }, icon:Icon(Icons.menu)), label: 'food menu'),


                      //Settings or Profile page
                      NavigationDestination(
                        icon: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const User_Profile()));
                            },
                            icon: const Icon(Icons.settings)),
                        label: 'Settings',
                      )
                    ]))));
  }
  TextStyle Style() {
    return TextStyle(
      color: Colors.grey[800],
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }
}

