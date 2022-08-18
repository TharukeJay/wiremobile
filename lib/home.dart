import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wireapps/cart.dart';
import 'package:wireapps/detail_screen.dart';
import 'package:wireapps/login_screen.dart';
import 'package:wireapps/model/item.dart';
import 'package:wireapps/provider/item_provider.dart';

import 'Widgets/card_square.dart';
import 'Widgets/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  ItemProvider itemProvider = ItemProvider();
  late Item items;
  bool lateLoad = false;
  late List<String> cartItemIds = [];

  void getItemData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getStringList('itemIdList') != null) {
      cartItemIds = prefs.getStringList('itemIdList')!;
    }
    // cartItemIds.add(value)
    itemProvider.getItemsData().then((res) {
      Map<String, dynamic> responseData = json.decode(res.body);
      setState(() {
        items = Item.fromJson(responseData);
        lateLoad = true;
      });
      if (kDebugMode) {
        print(items.data);
      }
    });
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    getItemData();
  }

  @override
  Widget build(BuildContext context) {

    buttonTapped() {
      if (kDebugMode) {
        print('tapped');
      }
    };

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 18.0,top: 8.0),
            child: Badge(
                toAnimate: false,
                shape: BadgeShape.circle,
                badgeColor: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
                badgeContent: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(cartItemIds.length.toString(), style: TextStyle(color: Colors.white)),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                    child: const Icon(Icons.shopping_cart, color: Colors.white,))),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Welcome', style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(246, 255, 255, 1.0).withOpacity(1.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            !lateLoad?shimmerContainerList() : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                reverse: false,
                itemCount: lateLoad ? items.data?.length : 0,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 18.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(
                                    itemObject: items.data?[index],
                                  ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: CardSquare(
                              price: items.data?[index].price?.amount,
                              title: '${items.data?[index].brandName} - ${items
                                  .data?[index].colour}',
                              img: items.data?[index].mainImage,
                              sub: items.data?[index].stockStatus,
                              currency: items.data?[index].price?.currency,
                              tap: buttonTapped),
                        ),
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
