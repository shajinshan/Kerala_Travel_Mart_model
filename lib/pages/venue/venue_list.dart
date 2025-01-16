import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/venue.dart';

class VenueList extends StatelessWidget {
  Venue venue;
  VenueList({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            height: MediaQuery.of(context).size.height / 6,
            width: double.infinity,
            venue.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                height: MediaQuery.of(context).size.height / 6,
                width: double.infinity,
                alignment: Alignment.center,
                child:const Text(
                  "Couldn't load",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Container(
          // height: MediaQuery.of(context).size.height / 3.2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 225, 0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //1st line
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //1st box text
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),

                      //category
                      child: Text(venue.category),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // 2nd box text
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 85, 28),
                          borderRadius: BorderRadius.circular(10)),

                      //date
                      child: Text(venue.getFormattedDate()),
                    ),
                  ],
                ),
              ),
              //Title
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  venue.name,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),

              //sub Para
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Text(
                  venue.description,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              //location
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //location text
                    const Text("Location"),

                    const SizedBox(
                      width: 10,
                    ),

                    //location icon
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 212, 11),
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () async {
                          final url = Uri.parse(venue.locationUrl);
                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            print("cannot open the url");
                          }
                        },
                        child: const Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
      ],
    );
  }
}
