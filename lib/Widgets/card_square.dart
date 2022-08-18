import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardSquare extends StatelessWidget {
  final String? price;
  final String? currency;
  final String? img;
  final Function? tap;
  final String? title;
  final String? sub;

  const CardSquare(
      {Key? key,this.title,
        this.sub,
        this.price,
        this.img,
        this.tap, this.currency});

  // static void defaultFunc() {
  //   if (kDebugMode) {
  //     print("the function works!");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
          height: 285,
          width: null,
          child: GestureDetector(
            child: Card(
                elevation: 3,
                shadowColor: const Color.fromRGBO(136, 152, 170, 1.0).withOpacity(0.22),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 3,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0)),
                                image: DecorationImage(
                                  image: NetworkImage(img!),
                                  fit: BoxFit.cover,
                                )))),
                    Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 9.0, bottom: 5.0, left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title!,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(44, 44, 44, 1.0), fontSize: 18)),
                                  Text(sub!,
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 15)),
                                  Text('$currency ${price!}',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(249, 99, 50, 1.0),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     tap;
                              //   },
                              //     child: const Icon(Icons.add_shopping_cart_outlined, color: Colors.deepOrange,))
                            ],
                          ),
                        ))
                  ],
                )),
          )),
    );
  }
}