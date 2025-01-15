import 'package:flutter/material.dart';
import 'package:karnataka_travel_expo/components/widgets/linear_process_indicator.dart';
import 'package:karnataka_travel_expo/screens/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../colors/asserts.dart';
import '../data/models/company_data_model.dart';
import '../provider/login_data_provider.dart';
import '../screens/company/company_login.dart';

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
                GlobalColor.color,
                GlobalColor.color,
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //home
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ListTile(
                      onTap: () => Navigator.pop(context),
                      leading: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: const Text(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ListTile(
                      onTap: () {
                        syncData(context);
                      },
                      leading: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      title: const Text("Sync Data",
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
                                          const LoginScreen()));
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
                              Provider.of<LoginDataProvider>(context,
                                      listen: false)
                                  .logout();
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

//Loader for Sync Data
  void syncData(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing
      builder: (BuildContext context) {
        return const CustomLinearProcessIndicator();
      },
    );

    await Future.delayed(
        Duration(seconds: 3)); // Replace with actual sync logic

    Navigator.of(context).pop();
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
          ? const Color.fromARGB(255, 48, 128, 132)
          : type == ToastificationType.info
              ? Colors.blue
              : type == ToastificationType.warning
                  ? Colors.orange
                  : Colors.red,
      foregroundColor: Colors.white,
    );
  }
}
