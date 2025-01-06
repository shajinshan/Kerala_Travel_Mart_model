import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/screens/company/company_login.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../data/models/company_data_model.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool loginState = false;

  @override
  void initState() {
    setState(() {
      loginState =
          Provider.of<CompanyDataModel>(context, listen: false).loginStatus;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    // color: Color.fromARGB(255, 255, 255, 255),
                    ),
                margin: EdgeInsets.zero, // Removes extra margin
                padding: EdgeInsets.zero, // Removes extra padding
                child: Image.asset("assets/icons/logo.png"),
              ),
            ],
          ),

          //drawer data
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 89, 30, 30),
                Color.fromARGB(255, 126, 25, 25),
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //home
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),

                  //Sync Data
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      title: Text("Sync Data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),
                  //Documents
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.file_present,
                        color: Colors.white,
                      ),
                      title: Text("Documents",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),
                  //Feedback
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text("FeedBack",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),

                  //about app
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.person_pin_rounded,
                        color: Colors.white,
                      ),
                      title: Text("About App",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),
                  //Login
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: !loginState
                        ? ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CompanyLogin()));
                            },
                            leading: const Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            title: const Text("Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400)),
                          )
                        :

                        //logout
                        ListTile(
                            onTap: () {
                              setState(() {
                                Provider.of<CompanyDataModel>(context,
                                        listen: false)
                                    .loginUpdate(false);
                              });
                              showToast(
                                  context,
                                  "Logout",
                                  "Your Account Was Logout Successfully",
                                  ToastificationType.success);
                              Navigator.pop(context);
                            },
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: const Text("Log out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400)),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //logout msg alert
  void showToast(BuildContext context, String title, String description,
      ToastificationType type) {
    toastification.show(
      context: context,
      type: type,
      title: Text(title),
      description: Text(description),
      primaryColor: Colors.white,
      autoCloseDuration: const Duration(seconds: 3),
      progressBarTheme: ProgressIndicatorThemeData(
        color: type == ToastificationType.success
            ? Colors.green
            : type == ToastificationType.info
                ? Colors.blue
                : type == ToastificationType.warning
                    ? Colors.orange
                    : Colors.red,
      ),
      showProgressBar: true,
      backgroundColor: type == ToastificationType.success
          ? const Color.fromARGB(255, 166, 12, 12)
          : type == ToastificationType.info
              ? Colors.blue
              : type == ToastificationType.warning
                  ? Colors.orange
                  : Colors.red,
      foregroundColor: Colors.white,
    );
  }
}
