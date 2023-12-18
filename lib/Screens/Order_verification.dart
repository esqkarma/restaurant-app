import 'package:flutter/material.dart';
import 'package:mealmates/Models/data.dart';
import 'package:mealmates/Models/db_Functions.dart';
import 'package:mealmates/Screens/AddItems.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController productNameCont = TextEditingController();
  TextEditingController regularPriceCont = TextEditingController();
  TextEditingController salePriceCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isSwitched=false ;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Product Menu",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: itemListNotifier,
          builder: (BuildContext ctx,List<ItemModel> itemList, Widget? child)
          {
            return ListView.separated(
                itemBuilder: (ctx,index){
                  final data = itemList[index];
                  return  Column(children: [
                     SizedBox(height: 30,),
                  Container(
                    height: MediaQuery.of(context).size.height/6,
                    width: MediaQuery.of(context).size.width/1.06,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const[
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius:1,
                          color: Colors.black
                        )
                      ],
                      color: Colors.white
                    ),
                    child:Row(
                      children: [
                       SizedBox(
                         height:MediaQuery.of(context).size.height/6.6,
                         width: MediaQuery.of(context).size.width/3,
                         child: Image.asset('assets/19-pizza-png-image.png'),
                       ),
                         Column(

                           children: [
                             Center(
                               child: Padding(
                                 padding: const EdgeInsets.only(top: 10,left: 10),
                                 child: Text(data.itemName,style: TextStyle(fontSize: 25),),
                               ),
                             ),
                             Row(
                               children: [
                                 SizedBox(width: 10,),
                                 Padding(
                                   padding: const EdgeInsets.all(10),
                                   child: Text("1 Dish"),
                                 ),

                                 Padding(
                                   padding: const EdgeInsets.only(left: 40),
                                   child: Text("Medium (9 inches)"),
                                 )
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [

                                 Text("₹"+data.salePrice,style: TextStyle(fontSize: 20,color: Colors.red),),
                                 SizedBox(width: 80 ,),
                                 Switch(
                                     activeColor: Colors.green,
                                     value: isSwitched,
                                     onChanged: (value) {
                                       setState(() {
                                         isSwitched = value;
                                       });
                                     })
                               ],
                             )
                           ],
                         ),

                      ],
                    ) ,
                  )
                  ],);
                },
                separatorBuilder: (ctx, index)
                {
                  return const SizedBox();
                }, 
                itemCount: itemList.length);
          },
        
          
      ),
      floatingActionButton: SizedBox(
        height: 58,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddItems()));
          },
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, shape: const CircleBorder(),),
        ),
      ),
    ));
  }

}
