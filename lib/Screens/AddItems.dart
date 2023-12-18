import 'package:flutter/material.dart';
import '../Models/data.dart';
import '../Models/db_Functions.dart';

class AddItems extends StatelessWidget {
  AddItems({super.key});
  TextEditingController productNameCont = TextEditingController();
  TextEditingController regularPriceCont = TextEditingController();
  TextEditingController salePriceCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(right: 265,bottom: 10),
            child: Text("Product Name"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width/1.1,
              child: TextField(
                controller: productNameCont,
                decoration: const InputDecoration(
                     border: OutlineInputBorder()),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(right: 220,bottom: 10),
            child: Text("Product Regular Price"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: SizedBox(
              width: MediaQuery.of(context).size.width/1.1,
              child: TextField(
                controller: regularPriceCont,
                decoration: const InputDecoration(
                     border: OutlineInputBorder()),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(right: 245,bottom: 10),
            child: Text("Product Sale Price"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: SizedBox(
              width: MediaQuery.of(context).size.width/1.1,
              child: TextField(
                controller: salePriceCont,
                decoration: const InputDecoration(
                     border: OutlineInputBorder()),
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 20),
           child: SizedBox(
             width: MediaQuery.of(context).size.width/1.3,

             child: ElevatedButton(
        onPressed: () {
              final data = ItemModel(itemName: productNameCont.text,
                  regularPrice: regularPriceCont.text,
                  salePrice: salePriceCont.text);
              final _prdName = productNameCont.text.trim();
              final _rglrPricce = regularPriceCont.text.trim();
              final _salePrice = salePriceCont.text.trim();
              if (_prdName.isEmpty || _rglrPricce.isEmpty || _salePrice.isEmpty) {
                return;
              }
              else {
                addItem(data);
                Navigator.of(context).pop(context);
              }
        }, child: const Text('add')),
           ),
         ),
        ],
      ),
    ));
  }
}
