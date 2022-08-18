import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wireapps/model/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class DetailScreen extends StatefulWidget {
  final Data? itemObject;

  const DetailScreen({Key? key, required this.itemObject}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Data? items;
  bool itemLoad = false;
  late List<String> itemIds = [];

  @override
  void initState() {
    setState(() {
      items = widget.itemObject!;
      itemLoad = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Item added to the cart'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    final bottomContentText = Text(
      widget.itemObject?.description ?? '',
      style: const TextStyle(fontSize: 18.0),
    );
    SharedPreferences prefs;
    final readButton = Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () async => {
            prefs = await SharedPreferences.getInstance(),
            if (prefs.getStringList('itemIdList') != null)
              {
                itemIds = prefs.getStringList('itemIdList')!,
              },
            itemIds.add(widget.itemObject!.id ?? ''),
            prefs.setStringList('itemIdList', itemIds),
            Scaffold.of(context).showSnackBar(snackBar)
          },
          color: Colors.deepOrange,
          child:
              const Text("Add to cart", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          '${widget.itemObject?.brandName ?? ''} - ${widget.itemObject?.colour ?? ''}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 285,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0)),
                      image: DecorationImage(
                        image: NetworkImage(widget.itemObject!.mainImage!),
                        fit: BoxFit.cover,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${widget.itemObject!.price!.currency!} ${widget.itemObject!.price!.amount!}',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${widget.itemObject!.brandName!} - ${widget.itemObject!.sKU!}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.itemObject!.name!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sizes - ${widget.itemObject!.sizes.toString()}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.itemObject!.stockStatus!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              bottomContent
            ],
          ),
        ),
      ),
    );
  }
}
