import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kerala_travel_mart/components/custom_text_field.dart';

class CompanyLogin extends StatefulWidget {
  const CompanyLogin({super.key});

  @override
  State<CompanyLogin> createState() => _CompanyLoginState();
}

class _CompanyLoginState extends State<CompanyLogin> {
  //stores error message
  String errorMsg = "";
  //password field hide
  bool hiddenTxt = true;

  //mail controller
  TextEditingController _mailController = TextEditingController();

  //password controller
  TextEditingController _passwordController = TextEditingController();

  //validate mail
  void validMail(dynamic mail) {
    if (int.tryParse(mail) != null && mail.length != 10) {
      setState(() {
        errorMsg = "invalid number";
      });
    } else if (mail.length == 10) {
      setState(() {
        errorMsg = "valid  number";
      });
    } else if (!mail.contains("@") && !mail.contains(".")) {
      setState(() {
        errorMsg = "invalid mail";
      });
    } else {
      setState(() {
        errorMsg = "";
      });
    }
  }

//valid Password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 240, 240),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: GoogleFonts.gelasio(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: InputField(
                  label: "Enter E-mail or Phone",
                  controller: _mailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  obscureText: hiddenTxt,

                  // controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hiddenTxt = !hiddenTxt;
                          });
                        },
                        child: hiddenTxt
                            ? Icon(Icons.remove_red_eye_outlined)
                            : Icon(Icons.remove_red_eye)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 223, 233, 238),
                    labelText: "Password",
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
                height: 8,
              ),
              Text(
                errorMsg,
                style: TextStyle(color: Colors.red),
              ),

              //btn login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Register button
                  GestureDetector(
                    onTap: () => validMail(_mailController.text),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 199, 55),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(" Create New Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
