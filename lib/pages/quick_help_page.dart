import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/asserts.dart';
import '../components/app_bar.dart';
import 'quick_help/list_item_quickhelp.dart';

class QuickHelpPage extends StatefulWidget {
  const QuickHelpPage({super.key});

  @override
  State<QuickHelpPage> createState() => _QuickHelpPageState();
}

class _QuickHelpPageState extends State<QuickHelpPage> {
  //questions
  List<String> questions = ["What is KITE?"];

  //answers
  List<String> answers = [
    "Kerala Travel Mart(KTM) is a biennial travel mart event aimed at attracting global and international buyers to Kerala, showcasing opportunities in the State's tourism sector."
  ];
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
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [GlobalColor.color, GlobalColor.color]),
                    ),

                    //text
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        textAlign: TextAlign.start,
                        "KITE 2024 Event FAQ",
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
                child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return ListItemQuickhelp(
                        question: questions[index],
                        answer: answers[index],
                      );
                    })),
          )
        ],
      ),
    );
  }
}
