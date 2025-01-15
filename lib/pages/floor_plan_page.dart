import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/asserts.dart';
import '../components/app_bar.dart';
import 'floor_plan/list_floor_plans.dart';

class FloorPlanPage extends StatefulWidget {
  const FloorPlanPage({super.key});

  @override
  State<FloorPlanPage> createState() => _FloorPlanPageState();
}

class _FloorPlanPageState extends State<FloorPlanPage> {
  //floor title
  List<String> floorTitle = [
    "Complete Floor Plan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      //body
      body: Column(
        children: [
          //top
          Padding(
            padding: const EdgeInsets.all(8.0),

            //
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              width: double.infinity,
              child: Column(
                children: [
                  //title container
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient:const LinearGradient(colors: [
                        GlobalColor.color,
                        GlobalColor.color,
                      ]),
                    ),

                    //text
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Select a Floor Plan",
                        style: GoogleFonts.sarabun(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  //search
                ],
              ),
            ),
          ),

          // Data loaded here
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: floorTitle.length,
                    itemBuilder: (context, index) {
                      return ListFloorPlans(
                        floorTitle: floorTitle[index],
                      );
                    })),
          )
        ],
      ),
    );
  }
}
