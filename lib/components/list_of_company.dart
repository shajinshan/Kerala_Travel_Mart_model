import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/data/models/company.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ListOfCompany extends StatefulWidget {
  Company company;
  ListOfCompany({super.key, required this.company});

  @override
  State<ListOfCompany> createState() => _ListOfCompanyState();
}

class _ListOfCompanyState extends State<ListOfCompany> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 227, 227),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: const Icon(Icons.house_siding_sharp),
          title: Text(widget.company.companyName),
          subtitle: InkWell(
            onTap: () async {
              final Uri url = Uri.parse(widget.company.websiteUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Could not open ${widget.company.websiteUrl}')),
                );
              }
            },
            child: Text(
              widget.company.websiteUrl,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
