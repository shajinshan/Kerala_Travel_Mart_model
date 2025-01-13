import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/data/models/company.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/app_bar.dart';
import '../../data/models/company_data_model.dart';

class ExhibitorsDetailScreen extends StatefulWidget {
  Company company;
  ExhibitorsDetailScreen({super.key, required this.company});

  @override
  State<ExhibitorsDetailScreen> createState() => _ExhibitorsDetailScreenState();
}

class _ExhibitorsDetailScreenState extends State<ExhibitorsDetailScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Consumer<CompanyDataModel>(
            builder: (context, companyDataModel, child) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.white,
                ),
                width: double.infinity,
                child: Column(children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 89, 30, 30),
                          Color.fromARGB(255, 126, 25, 25),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Exhibitors",
                        style: GoogleFonts.sarabun(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //Image Container
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 141, 141, 141),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),

                    //Round Logo
                    Positioned(
                      bottom: 0,
                      right: MediaQuery.of(context).size.width / 2.8,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 232, 232, 232),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 0,
                  ),

                  //Name Of Company
                  Text(
                    widget.company.companyName.toUpperCase(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Scroll Button
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(171, 171, 171, 1)),
                    child: Row(
                      children: [
                        //Profile Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedIndex == 0
                                      ? const Color.fromARGB(255, 237, 237, 235)
                                      : Colors.transparent),
                              child: const Center(child: Text("Profile")),
                            ),
                          ),
                        ),
                        //Contact Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedIndex == 1
                                      ? const Color.fromARGB(255, 237, 237, 235)
                                      : Colors.transparent),
                              child: const Center(child: Text("Contact")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //container for detail
                  _selectedIndex == 0
                      ? SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: ExhibitorProfile(
                            company: widget.company,
                          ),
                        )
                      : SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: ExhibitorsContact(
                            company: widget.company,
                          ),
                        )
                ]),
              ),
            ),
          ]);
        }),
      ),
    );
  }
}

//profile class
class ExhibitorProfile extends StatelessWidget {
  Company company;
  ExhibitorProfile({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Highlights",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(company.highlights),
          ),
          //website button
          Center(
            child: GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse('https://www.nextgensolutions.com/');

                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    mode: LaunchMode
                        .externalApplication, // Ensures it opens in a browser
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open the website')),
                  );
                }
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Website",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//contact class
// ignore: must_be_immutable
class ExhibitorsContact extends StatelessWidget {
  Company company;
  ExhibitorsContact({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Location
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.location_on_sharp),
                Text(company.city)
              ],
            ),
          ),

          //Phone
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [const Icon(Icons.phone), Text(company.phone)],
            ),
          ),
          //Mail
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [const Icon(Icons.mail), Text(company.email)],
            ),
          ),
        ],
      ),
    );
  }
}
