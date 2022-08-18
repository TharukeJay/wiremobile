import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wireapps/provider/item_provider.dart';

import 'model/item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ItemProvider itemProvider = ItemProvider();
  late List<String> cartItemIds = [];
  late List<Data> cartItems = [];
  late Item items;
  late double total = 0;
  bool lateLoad = false;

  getItemDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('itemIdList') != null) {
      cartItemIds = prefs.getStringList('itemIdList')!;
    }
    itemProvider.getItemsData().then((res) {
      Map<String, dynamic> responseData = json.decode(res.body);
      setState(() {
        items = Item.fromJson(responseData);
        items.data?.forEach((element1) {
          for (var element2 in cartItemIds) {
            if (element1.id == element2) {
              cartItems.add(element1);
              total = total + double.parse(element1.price!.amount!);
            }
          }
        });
        lateLoad = true;
      });

      if (kDebugMode) {
        print(items.data);
      }
    });
  }

  @override
  void initState() {
    getItemDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(cartItemIds.isEmpty)Card(
              elevation: 3,
              shadowColor: const Color.fromRGBO(136, 152, 170, 1.0).withOpacity(0.22),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: const Center(
                child: Text('No any Items yet \nPlease add items to cart to continue',
                    style: TextStyle(
                        color: Color.fromRGBO(44, 44, 44, 1.0), fontSize: 25),
                textAlign: TextAlign.center,),
              ),
            ),
            if(cartItemIds.isNotEmpty)ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                reverse: false,
                itemCount: lateLoad ? cartItems.length : 0,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {

                  return Card(
                    elevation: 3,
                    shadowColor: const Color.fromRGBO(136, 152, 170, 1.0).withOpacity(0.22),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.network(cartItems[index].mainImage!, width: 200,height: 150,)
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItems[index].brandName!,
                                style: const TextStyle(
                                    color: Color.fromRGBO(44, 44, 44, 1.0), fontSize: 18)),
                            Text(cartItems[index].sKU!,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15)),
                            Text(cartItems[index].price!.amount!,
                                style: const TextStyle(
                                    color: Color.fromRGBO(249, 99, 50, 1.0),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            if(cartItemIds.isNotEmpty)Card(
              elevation: 3,
              shadowColor: const Color.fromRGBO(136, 152, 170, 1.0).withOpacity(0.22),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Total amount',
                      style: TextStyle(
                          color: Color.fromRGBO(44, 44, 44, 1.0), fontSize: 25)),

                      Text('GBP ${total.toString()}',
                          style: const TextStyle(
                              color: Color.fromRGBO(249, 99, 50, 1.0),
                              fontSize: 12,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}
