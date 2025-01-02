import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kerala_travel_mart/components/custom_text_field.dart';
import 'package:kerala_travel_mart/screens/company/company_login.dart';

class CompanyRegister extends StatefulWidget {
  const CompanyRegister({super.key});

  @override
  State<CompanyRegister> createState() => _CompanyRegisterState();
}

class _CompanyRegisterState extends State<CompanyRegister> {
  // Variable to store selected date
  DateTime? _selectedDate;

  // TextEditingController to display formatted date
  final TextEditingController _dateController = TextEditingController();

  //date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900), // Earliest allowable date
      lastDate: DateTime.now(), // Latest allowable date
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate); // Format date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CompanyLogin()));
        },
        child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 202, 55),
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.person_add,
              color: Colors.white,
            )),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //top design

              Text(
                "Register",
                style: GoogleFonts.spectral(
                  fontSize: 32,
                ),
              ),

              //form
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //company name

                    InputField(
                      label: "Company Name",
                      typeOfKeyboard: TextInputType.text,
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "registration Number",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => _pickDate(context),
                      child: AbsorbPointer(
                        child: InputField(
                          label: "Date of Incorporate",
                          controller: _dateController,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Contact Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    InputField(
                      label: "email",
                      typeOfKeyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Phone",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Website Url",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Address",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "City",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "State",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Pin Code",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Country",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InputField(
                      label: " New Password",
                      typeOfKeyboard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Login Option
                    Row(
                      children: [
                        const Text("Already have account"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CompanyLogin()));
                            },
                            child: const Text("Login"))
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Register button
                        GestureDetector(
                          onTap: () {
                            print("register");
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 26, 164, 195),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
