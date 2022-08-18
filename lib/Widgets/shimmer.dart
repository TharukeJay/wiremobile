import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerList() {
  return SizedBox(
    height: 80.0,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Padding(
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
                                child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.blueGrey,
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0)),
                                    )))),
                            Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 9.0, bottom: 5.0, left: 16.0, right: 16.0),
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.blueGrey,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          SizedBox(
                                            height: 10,
                                            width: double.infinity,
                                          ),
                                          SizedBox(
                                            height: 10,
                                            width: double.infinity,
                                          ),
                                          SizedBox(
                                            height: 10,
                                            width: double.infinity,
                                          ),
                                        ],
                                      ))
                                ))
                          ],
                        )),
                  )),
            )
          );
        }),
  );
}

Widget shimmerContainerList() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(30.0)),
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: 200,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    // const CircleAvatar(
                    //   radius: 40,
                    //   backgroundColor: Colors.grey,
                    // ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 230,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: Colors.grey[400],
                              shape: const RoundedRectangleBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 180,
                            height: 14,
                            decoration: ShapeDecoration(
                              color: Colors.grey[400],
                              shape: const RoundedRectangleBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 130,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: Colors.grey[400],
                              shape: const RoundedRectangleBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400],
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400],
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400],
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400],
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400],
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400],
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}