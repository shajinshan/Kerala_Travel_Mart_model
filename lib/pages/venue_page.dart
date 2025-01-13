import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_bar.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({super.key});

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
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
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Venue Details",
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
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                //chid widget
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: double.infinity,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.2,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 166, 165, 163),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
