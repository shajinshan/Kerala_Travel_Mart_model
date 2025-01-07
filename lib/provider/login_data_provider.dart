import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/company_data_model.dart';

class LoginDataProvider extends ChangeNotifier {
  String login(BuildContext context, String user, String password) {
    final allCompanyProfile =
        Provider.of<CompanyDataModel>(context, listen: false).allCompanyProfile;

    for (var company in allCompanyProfile) {
      if ((user == company.email || user == company.phone) &&
          password == company.password) {
        saveUserId(company.id);
        return company.id;
      }
    }
    return "";
  }
//all save shared_preferences
  Future<void> saveUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', id);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }
  Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_id'); 
}

}
