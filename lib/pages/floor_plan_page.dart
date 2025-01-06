import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_bar.dart';

class FloorPlanPage extends StatefulWidget {
  const FloorPlanPage({super.key});

  @override
  State<FloorPlanPage> createState() => _FloorPlanPageState();
}

class _FloorPlanPageState extends State<FloorPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(),

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
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 89, 30, 30),
                        Color.fromARGB(255, 126, 25, 25),
                      ]),
                    ),

                    //text
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Floor Plan",
                        style: GoogleFonts.sarabun(
                            fontSize: 30,
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
              child: Container(
                color: const Color.fromARGB(255, 118, 74, 74),

                //chid widget
              ),
            ),
          )
        ],
      ),
    );
  }
}
