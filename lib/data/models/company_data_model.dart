import 'package:flutter/cupertino.dart';

import 'company.dart';

class CompanyDataModel extends ChangeNotifier {
  List<Company> allCompanyProfile = [
    Company(
        id: "01",
        companyName: "Touch Q",
        registerNumber: "000133",
        date: "01/01/2000",
        email: "info@touchqsolutions.com",
        phone: "9659789283",
        websiteUrl: "https://www.touchqsolutions.com/",
        city: "Ernakulam",
        state: "Kerala",
        pin: "682304",
        country: "India",
        password: "1234",
        highlights:
            'We are a mix of strategists, creative directors, designers, writers, media strategists, digital marketers, developers and relationship builders. We’re committed to creating vibrant and relevant brand experiences on every level.'),
    Company(
        id: "002",
        companyName: "Tech Innovators",
        registerNumber: "000234",
        date: "05/03/2005",
        email: "contact@techinnovators.com",
        phone: "9876543210",
        websiteUrl: "https://www.techinnovators.com/",
        city: "Kochi",
        state: "tamilnadu",
        pin: "682310",
        country: "India",
        password: "password123",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "003",
        companyName: "Bright Solutions",
        registerNumber: "000345",
        date: "12/11/2010",
        email: "support@brightsolutions.com",
        phone: "9123456789",
        websiteUrl: "https://www.brightsolutions.com/",
        city: "Thrissur",
        state: "Kerala",
        pin: "680001",
        country: "India",
        password: "admin123",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "004",
        companyName: "Global Tech",
        registerNumber: "000456",
        date: "07/07/2015",
        email: "info@globaltech.com",
        phone: "9801234567",
        websiteUrl: "https://www.globaltech.com/",
        city: "kollam",
        state: "Kerala",
        pin: "695014",
        country: "India",
        password: "global2021",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "005",
        companyName: "Smart Systems",
        registerNumber: "000567",
        date: "09/09/2018",
        email: "hello@smartsystems.com",
        phone: "9998887776",
        websiteUrl: "https://www.smartsystems.com/",
        city: "Kannur",
        state: "Kerala",
        pin: "670001",
        country: "India",
        password: "smart2023",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "006",
        companyName: "Dynamic Corp",
        registerNumber: "000678",
        date: "01/02/2020",
        email: "contact@dynamiccorp.com",
        phone: "8887776665",
        websiteUrl: "https://www.dynamiccorp.com/",
        city: "koyambator",
        state: "Tamilnadu",
        pin: "686001",
        country: "India",
        password: "dynamic456",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "007",
        companyName: "Infinity IT",
        registerNumber: "000789",
        date: "15/08/2019",
        email: "support@infinityit.com",
        phone: "7776665554",
        websiteUrl: "https://www.infinityit.com/",
        city: "Alappuzha",
        state: "Kerala",
        pin: "688001",
        country: "India",
        password: "infinity987",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "008",
        companyName: "NextGen Solutions",
        registerNumber: "000890",
        date: "22/04/2017",
        email: "info@nextgensolutions.com",
        phone: "6665554443",
        websiteUrl: "https://www.nextgensolutions.com/",
        city: "Palakkad",
        state: "Kerala",
        pin: "678001",
        country: "India",
        password: "nextgen234",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "009",
        companyName: "Prime Technologies",
        registerNumber: "000901",
        date: "13/03/2021",
        email: "contact@primetechnologies.com",
        phone: "5554443332",
        websiteUrl: "https://www.primetechnologies.com/",
        city: "Kollam",
        state: "Kerala",
        pin: "691001",
        country: "India",
        password: "prime2022",
        highlights: 'hiihhoiopnopjihh'),
    Company(
        id: "010",
        companyName: "Pioneer Tech",
        registerNumber: "000112",
        date: "20/06/2016",
        email: "support@pioneertechnologies.com",
        phone: "12",
        websiteUrl: "https://www.pioneertechnologies.com/",
        city: "Malappuram",
        state: "Kerala",
        pin: "676001",
        country: "India",
        password: "12",
        highlights: 'hiihhoiopnopjihh'),
  ];

  bool loginStatus = false;
  String loginId = "";

// login status change function
  void loginUpdate(bool val) {
    loginStatus = val;
    notifyListeners();
  }

//login id
  void updateLoginId(String id) {
    loginId = id;
  }

//register
  void registerNew(Company company) {
    allCompanyProfile.add(company);
    notifyListeners();
  }

  //List all company
  List<Company> listAll() {
    return allCompanyProfile;
  }

  // //login
  // String login(String user, String password) {
  //   for (var company in allCompanyProfile) {
  //     if ((user == company.email || user == company.phone) &&
  //         password == company.password) {
  //       return company.id;
  //     }
  //   }
  //   return "";
  // }

//refresh
  Future<void> fetchCompanies() async {
    await Future.delayed(const Duration(seconds: 1));

    // data fetched
    List<Company> fetchedCompanies = [
      // Add more companies as needed
    ];

    for (Company c in fetchedCompanies) {
      allCompanyProfile.add(c);
    }
    notifyListeners();
  }

//search method
  List<Company> searchComapany(String query) {
    if (query.isEmpty) {
      return allCompanyProfile;
    } else {
      return allCompanyProfile
          .where((company) =>
              company.companyName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }


  //get Single Company data
  Company? getCompanyData(String id) {
    for (Company c in allCompanyProfile) {
      if (id == c.id) {
        return c;
      }
    }
    return null;
  }
}
