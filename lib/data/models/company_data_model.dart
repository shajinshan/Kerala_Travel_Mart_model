import 'package:flutter/cupertino.dart';
import 'package:kerala_travel_mart/data/models/company.dart';

class CompanyDataModel extends ChangeNotifier {
  List<Company> allCompanyProfile = [
    Company(
        companyName: "Touch Q",
        registerNumber: "000133",
        date: "01/01/2000",
        email: "sha",
        phone: "9659789283",
        websiteUrl: "https://www.touchqsolutions.com/",
        city: "Ernakulam",
        state: "Kerala",
        pin: "682304",
        country: "India",
        password: "1234"),
  ];

//register
  void registerNew(Company company) {
    allCompanyProfile.add(company);
    notifyListeners();
  }

  //List all company
  List<Company> listAll() {
    return allCompanyProfile;
  }

  //login
  String login(String user, String password) {
    for (var company in allCompanyProfile) {
      if ((user == company.email || user == company.phone) &&
          password == company.password) {
        return "Login Success";
      }
    }
    return "Login failed";
  }
}
