import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kerala_travel_mart/components/custom_text_field.dart';
import 'package:kerala_travel_mart/data/models/company.dart';
import 'package:kerala_travel_mart/data/models/company_data_model.dart';
import 'package:kerala_travel_mart/screens/MenuScreen.dart';
import 'package:kerala_travel_mart/screens/company/company_login.dart';
import 'package:provider/provider.dart';

import '../../components/alert_dialog.dart';

class CompanyRegister extends StatefulWidget {
  const CompanyRegister({super.key});

  @override
  State<CompanyRegister> createState() => _CompanyRegisterState();
}

class _CompanyRegisterState extends State<CompanyRegister> {
  //register controllers
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _registerNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _webUrlController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

//register func;
  void registerNewCompany() {
    //validate input field

    // if (_cityController.text == "" ||
    //     _companyNameController.text == "" ||
    //     _registerNumberController.text == "" ||
    //     _dateController.text == "" ||
    //     _emailController.text == "" ||
    //     _phoneController.text == "" ||
    //     _webUrlController.text == "" ||
    //     _stateController.text == "" ||
    //     _pincodeController.text == "" ||
    //     _countryController.text == "") {
    //   showDialog(
    //     context: context,
    //     builder: (contex) => const AlertDialog(
    //       title: Text("please fill All fields"),
    //     ),
    //   );
    //   return;
    // }
    Company company = Company(
        companyName: _companyNameController.text,
        registerNumber: _registerNumberController.text,
        date: _dateController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        websiteUrl: _webUrlController.text,
        city: _cityController.text,
        state: _stateController.text,
        pin: _pincodeController.text,
        country: _countryController.text,
        password: _passwordController.text);
    try {
      print("start register =======>>>>>.");
      Provider.of<CompanyDataModel>(context, listen: false)
          .registerNew(company);
      showDialog(
        context: context,
        builder: (contex) => CustomDialog(
            content: "Registered ", icons: Icons.done, onTap: navToHome),
      );
      //delay for 2sec
    } catch (error) {
      print(' register error=> ${error} ');
    }
  }

  void navToHome() {
    print("object");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MenuScreen()));
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
                      controller: _companyNameController,
                      typeOfKeyboard: TextInputType.text,
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "registration Number",
                      typeOfKeyboard: TextInputType.number,
                      controller: _registerNumberController,
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
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Phone",
                      typeOfKeyboard: TextInputType.number,
                      controller: _phoneController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Website Url",
                      typeOfKeyboard: TextInputType.number,
                      controller: _webUrlController,
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
                      controller: _cityController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "State",
                      typeOfKeyboard: TextInputType.number,
                      controller: _stateController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Pin Code",
                      typeOfKeyboard: TextInputType.number,
                      controller: _pincodeController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      label: "Country",
                      typeOfKeyboard: TextInputType.number,
                      controller: _countryController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InputField(
                      label: " New Password",
                      typeOfKeyboard: TextInputType.number,
                      controller: _passwordController,
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
                            registerNewCompany();
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
