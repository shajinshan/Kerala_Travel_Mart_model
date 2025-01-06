import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/components/app_bar.dart';

class ProgrammesPage extends StatefulWidget {
  const ProgrammesPage({super.key});

  @override
  State<ProgrammesPage> createState() => _ProgrammesPageState();
}

class _ProgrammesPageState extends State<ProgrammesPage> {
  //filter btn state
  bool filterBtn = false;

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
                // color: const Color.fromARGB(255, 255, 255, 255)
              ),
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
                        "Programme Schedule",
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

                  Container(
                    height: 60,
                    width: double.infinity,
                    // color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //filter drop down
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: const Color.fromARGB(255, 234, 233, 231)
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
                            // color:  Color.fromARGB(255, 234, 233, 231)
                            //
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
                        ),
                        const Icon(Icons.favorite_border)
                      ],
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
            child: SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(255, 247, 247, 247),

                //chid widget
              ),
            ),
          ))
        ],
      ),
    );
  }
}
