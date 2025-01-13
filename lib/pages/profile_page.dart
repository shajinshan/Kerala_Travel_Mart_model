import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/data/models/company.dart';
import 'package:kerala_travel_mart/screens/company/company_login.dart';
import 'package:kerala_travel_mart/shimmer/profile_shimmer_loading.dart';
import 'package:provider/provider.dart';

import '../components/app_bar.dart';
import '../data/models/company_data_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loginStatus = false;
  String id = "";
  Company? comapany;
  @override
  void initState() {
    setState(() {
      id = Provider.of<CompanyDataModel>(context, listen: false).loginId;
      loginStatus =
          Provider.of<CompanyDataModel>(context, listen: false).loginStatus;

      comapany = Provider.of<CompanyDataModel>(context, listen: false)
          .getCompanyData(id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //if login
    Widget login = comapany == null
        ? const Center(child: ProfileShimmerLoading()) // Show loading spinner
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10, left: MediaQuery.of(context).size.width / 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.network(
                        "https://media.istockphoto.com/id/184962061/photo/business-towers.jpg?s=1024x1024&w=is&k=20&c=k00r5Qd3hZF0TpH1mQBJn3-x08DjIgEqsY-8vQma1WM=",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  comapany!.companyName,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Register Number :${comapany!.registerNumber}",
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 10),
                Text(
                  "Email : ${comapany!.email}",
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 10),
                Text(
                  "City : ${comapany!.city}",
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 10),
                Text(
                  "Website : ${comapany!.websiteUrl}",
                  style: const TextStyle(fontSize: 17, color: Colors.blue),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );

    //if not login
    Widget notLogin = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Please Login to View Profile"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 27, 204, 50)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => const CompanyLogin(),
                  ),
                );
              },
              child: const Text("Log in"))
        ],
      ),
    );
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
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 89, 30, 30),
                        Color.fromARGB(255, 126, 25, 25),
                        // Color(0xFF2B6A77), Color(0xFF2B6A77)
                      ]),
                    ),

                    //text
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.person_outlined,
                            color: Colors.white,
                            size: 33,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            "Profile",
                            style: GoogleFonts.sarabun(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
                padding: const EdgeInsets.all(9.0),
                child: loginStatus ? login : notLogin
                //chid widget
                ),
          ),
        ],
      ),
    );
  }
}
