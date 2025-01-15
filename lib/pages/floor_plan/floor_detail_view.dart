import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/asserts.dart';
import '../../components/app_bar.dart';

class FloorDetailView extends StatelessWidget {
  final String title;
  const FloorDetailView({super.key, required this.title});

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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [GlobalColor.color, GlobalColor.color]),
                    ),

                    //text
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, bottom: 20, right: 4),
                      child: Text(
                        textAlign: TextAlign.start,
                        'Floo Plan - ${title}',
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
