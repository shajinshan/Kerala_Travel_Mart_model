import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../colors/asserts.dart';
import '../components/app_bar.dart';
import '../components/list_of_company.dart';
import '../components/shimmer_loading_widget.dart';
import '../data/models/company.dart';
import '../data/models/company_data_model.dart';
import 'exhibitor/exhibitors_detail_screen.dart';

class ExhibitorsPage extends StatefulWidget {
  const ExhibitorsPage({super.key});

  @override
  State<ExhibitorsPage> createState() => _ExhibitorsPageState();
}

Timer? _timer;

class _ExhibitorsPageState extends State<ExhibitorsPage> {
  //search query
  String searchQuery = "";

  bool filterBtn = false;

  void refresh() {
    Provider.of<CompanyDataModel>(context, listen: false).fetchCompanies();
    print("Data refreshed");
  }

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
    List<Company> filteredData =
        Provider.of<CompanyDataModel>(context, listen: false)
            .searchComapany(searchQuery);

    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          refresh(); // Refresh the data when button is clicked
        },
        icon: Icon(Icons.refresh),
      ),
      appBar: CustomAppBar(),
      body: Consumer<CompanyDataModel>(
        builder: (context, companyDataModel, child) {
          return Column(
            children: [
              // Top filter buttons
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient:const LinearGradient(
                            colors: [GlobalColor.color, GlobalColor.color],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Exhibitors",
                            style: GoogleFonts.sarabun(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Show filter button if `filterBtn` is true
                      filterBtn
                          ? Container(
                              height: 60,
                              width: double.infinity,
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Category dropdown
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // color: Color.fromARGB(255, 157, 118, 42),
                                    ),
                                    child: DropdownButton(
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'tamilnadu',
                                          child: Text('tamilnadu'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Kerala',
                                          child: Text('Kerala'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Option3',
                                          child: Text('Option 3'),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                      hint: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("select location"),
                                      ),
                                    ),
                                  ),

                                  // Hall dropdown
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // color: Color.fromARGB(255, 234, 233, 231),
                                    ),
                                    child: DropdownButton(
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'Option1',
                                          child: Text('Option 1'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Option2',
                                          child: Text('Option 2'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Option3',
                                          child: Text('Option 3'),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                      hint: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Hall"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              // Search and Filter Row
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: const Color.fromARGB(255, 223, 233, 238),
                          labelText: "Search Exhibitors",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 239, 245, 248),
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 239, 245, 248),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        filterBtn = !filterBtn;
                      });
                    },
                    icon: const Icon(Icons.filter_list),
                    // color: Colors.black54,
                  ),
                ],
              ),

              // List of Companies
              Expanded(
                child: isLoading
                    ? const ShimmerLoading()
                    : ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          Company company = filteredData[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ExhibitorsDetailScreen(
                                              company: filteredData[index],
                                            )));
                              },
                              child: ListOfCompany(
                                company: company,
                              ));
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
