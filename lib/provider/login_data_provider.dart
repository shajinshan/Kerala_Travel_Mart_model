import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/company_data_model.dart';

class LoginDataProvider extends ChangeNotifier {
  
  String login(BuildContext context, String user, String password) {
   
    final allCompanyProfile =
        Provider.of<CompanyDataModel>(context, listen: false).allCompanyProfile;

    for (var company in allCompanyProfile) {
      if ((user == company.email || user == company.phone) &&
          password == company.password) {
        return company.id;
      }
    }
    return "";
  }
}
