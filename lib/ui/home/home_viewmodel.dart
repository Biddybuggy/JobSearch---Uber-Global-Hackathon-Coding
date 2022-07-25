import 'package:intl/intl.dart';
import 'package:job_search/resources/pref_contracts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../hive/boxes.dart';
import '../../hive/company/company.dart';
import '../../hive/job/job.dart';

class HomeViewModel {
  List<Job> getJobs() {
    return Boxes.getJobs().values.toList();
  }

  List<Company> getCompanies() {
    return Boxes.getCompanies().values.toList();
  }

  List<String> getCompaniesNameFromLast() {
    List<String> companyList = [];
    for (int i = 0; i < getCompanies().length; i++) {
      companyList.add(getCompanies()[i].name!);
    }

    return companyList.reversed.toList();
  }

  Future<String> getUserType() async {
    var sharedPreference = await SharedPreferences.getInstance();
    var userType = sharedPreference.getString(PrefContracts.USER_TYPE) ?? "";
    return userType;
  }

  String getNeedsManagement(String salary) {
    final currencyFormatter = NumberFormat.currency(locale: 'ID',symbol: "Rp. ");

    if (!salary.isEmpty) {
      return currencyFormatter.format(double.parse(salary) * 50 / 100);
    } else {
      return "0";
    }
  }

  String getInvestManagement(String salary) {
    final currencyFormatter = NumberFormat.currency(locale: 'ID',symbol: "Rp. ");
    if (!salary.isEmpty) {
      return currencyFormatter.format(double.parse(salary) * 30 / 100);
    } else {
      return "0";
    }
  }

  String getSavingManagement(String salary) {
    final currencyFormatter = NumberFormat.currency(locale: 'ID',symbol: "Rp. ");
    if (!salary.isEmpty) {
      return currencyFormatter.format(double.parse(salary) * 20 / 100);
    } else {
      return "0";
    }
  }

}
