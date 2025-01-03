import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/data/models/company.dart';

class ListOfCompany extends StatefulWidget {
  Company company;
  ListOfCompany({super.key, required this.company});

  @override
  State<ListOfCompany> createState() => _ListOfCompanyState();
}

class _ListOfCompanyState extends State<ListOfCompany> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.company.companyName),
      subtitle: Text(widget.company.email),
    );
  }
}
