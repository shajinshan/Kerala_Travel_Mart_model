import 'package:flutter/material.dart';

class ListItemQuickhelp extends StatefulWidget {
  final String question;
  final String answer;
  const ListItemQuickhelp(
      {super.key, required this.question, required this.answer});

  @override
  State<ListItemQuickhelp> createState() => _ListItemQuickhelpState();
}

class _ListItemQuickhelpState extends State<ListItemQuickhelp> {
  bool isDropdown = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isDropdown = !isDropdown;
          });
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 15, 174, 34)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                    child: Text(
                      widget.question,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Icon(
                        isDropdown
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down_sharp,
                        key: ValueKey<bool>(
                            isDropdown), // Unique key to differentiate widgets
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              //dropdown paragraphs
              isDropdown
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.answer,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
