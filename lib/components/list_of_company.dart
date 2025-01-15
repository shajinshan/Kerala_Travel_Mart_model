import 'package:flutter/material.dart';

import '../data/models/company.dart';

// ignore: must_be_immutable
class ListOfCompany extends StatefulWidget {
  Company company;
  ListOfCompany({super.key, required this.company});

  @override
  State<ListOfCompany> createState() => _ListOfCompanyState();
}

class _ListOfCompanyState extends State<ListOfCompany> {
  bool saveBtnState = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            saveBtnState = !saveBtnState;
          });
         
        },
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 224, 227, 227),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
                //conatiner view data
                color: const Color.fromARGB(255, 231, 230, 228),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //img
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 162, 163, 163),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),

                        //title
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                widget.company.companyName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 73, 209, 24)),
                                child: Text(
                                  widget.company.companyName,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //location
                    Center(
                      widthFactor: 1.5,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(85, 0, 0, 0),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          widget.company.city,
                          style:
                              const TextStyle(fontSize: 8, color: Colors.white),
                        ),
                      ),
                    ),
                    //
                  ],
                ),

                //icon
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    saveBtnState
                        ? Icons.bookmark_sharp
                        : Icons.bookmark_outline_sharp,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
