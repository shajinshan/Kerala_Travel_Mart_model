import 'package:flutter/material.dart';
import 'package:kerala_travel_mart/data/models/company.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
      subtitle: InkWell(
        onTap: () async {
          print("object");
          final Uri url = Uri.parse(widget.company.websiteUrl);
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not open ${widget.company.websiteUrl}')),
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
    );
  }
}
