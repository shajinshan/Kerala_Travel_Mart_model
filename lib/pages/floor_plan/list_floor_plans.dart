import 'package:flutter/material.dart';

import 'floor_detail_view.dart';

class ListFloorPlans extends StatefulWidget {
  final String floorTitle;
  const ListFloorPlans({super.key, required this.floorTitle});

  @override
  State<ListFloorPlans> createState() => _ListFloorPlansState();
}

class _ListFloorPlansState extends State<ListFloorPlans> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FloorDetailView(
                          title: widget.floorTitle,
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 7.0,
                    spreadRadius: .09,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 5),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 220,
                    child: Text(
                      textAlign: TextAlign.justify,
                      widget.floorTitle,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Icon(Icons.navigate_next_outlined)
                ],
              ),
            ),
          ),
        ));
  }
}
