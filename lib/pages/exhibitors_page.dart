import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/components/app_bar.dart';
import 'package:kerala_travel_mart/components/list_of_company.dart';
import 'package:kerala_travel_mart/data/models/company.dart';
import 'package:kerala_travel_mart/data/models/company_data_model.dart';
import 'package:provider/provider.dart';

class ExhibitorsPage extends StatefulWidget {
  const ExhibitorsPage({super.key});

  @override
  State<ExhibitorsPage> createState() => _ExhibitorsPageState();
}

class _ExhibitorsPageState extends State<ExhibitorsPage> {
  //filter btn state
  bool filterBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      //body
      body: Consumer<CompanyDataModel>(
        builder: (context, value, child) => Column(
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
                          "Exhibitors",
                          style: GoogleFonts.sarabun(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    //spacing
                    const SizedBox(
                      height: 10,
                    ),

                    filterBtn
                        ? Container(
                            height: 60,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //filter drop down
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 234, 233, 231)),
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
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    hint: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Category"),
                                    ),
                                  ),
                                ),

                                //another dropdown button
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 234, 233, 231)),
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
                    //search
                    Row(
                      children: [
                        // Search Field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 223, 233, 238),
                              labelText: "Search Exhibitors",
                              prefixIcon: const Icon(Icons.search),
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
                        const SizedBox(
                            width: 10), // Space between TextField and Icon
                        // Filter Icon
                        IconButton(
                          onPressed: () {
                            setState(() {
                              filterBtn = !filterBtn;
                            });
                          },
                          icon: const Icon(Icons.filter_list),
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Data loaded here
            Expanded(
              child: ListView.builder(
                  itemCount: value.listAll().length,
                  itemBuilder: (context, index) {
                    Company company = value.listAll()[index];
                    return ListOfCompany(company: company);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
