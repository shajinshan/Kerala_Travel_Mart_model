import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/data/models/company.dart';

class ListOfCompany extends StatelessWidget {
  Company company;
  ListOfCompany({super.key,required this.company});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(company.companyName),
      subtitle: Text(company.email),
    );
  }
}
