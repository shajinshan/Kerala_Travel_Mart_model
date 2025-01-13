import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/components/shimmer_loading_widget.dart';
import 'package:kerala_travel_mart/data/models/venue.dart';
import 'package:kerala_travel_mart/data/models/venue_data_model.dart';
import 'package:kerala_travel_mart/pages/venue/venue_list.dart';
import 'package:provider/provider.dart';

import '../components/app_bar.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({super.key});

  @override
  State<VenuePage> createState() => _VenuePageState();
}

Timer? _timer;

class _VenuePageState extends State<VenuePage> {
  bool isLoading = true;
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //getting data
    List<Venue> venuesList =
        Provider.of<VenueDataModel>(context, listen: false).venues;
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
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 31, 84, 100),
                        Color.fromARGB(255, 36, 83, 107),
                      ]),
                    ),

                    //text
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Venue Details",
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
              //chid widget
              child: isLoading
                  ? ShimmerLoading()
                  : ListView.builder(
                      itemCount: venuesList.length,  
                      itemBuilder: (context, index) {
                        Venue venueDataModel = venuesList[index];
                        return VenueList(
                          venue: venueDataModel,
                        );
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
