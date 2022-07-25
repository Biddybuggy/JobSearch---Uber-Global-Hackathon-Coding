import 'package:job_search/resources/pref_contracts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../hive/boxes.dart';
import '../../hive/company/company.dart';
import '../../hive/job/job.dart';

class JobAddFormViewModel {
  List<Company> getCompanies() {
    return Boxes.getCompanies().values.toList();
  }

  List<Job> getJobs() {
    return Boxes.getJobs().values.toList();
  }

  Future<void> inputJobs({required String name, required String description, required String salary, required String location}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    var userName = sharedPreference.getString(PrefContracts.USER_NAME) ?? "";

    bool isCompanyExist = false;
    for (int i = 0; i < getCompanies().length; i++) {
      if (userName == getCompanies()[i].name) {
        isCompanyExist = true;
        break;
      }
    }
    if (!isCompanyExist) {
      final company = Company()
        ..companyId = userName
        ..name = userName;

      final companies = Boxes.getCompanies();
      companies.add(company);
    }

    final job = Job()
      ..companyId = userName
      ..name = name
      ..description = description
      ..jobId = const Uuid().v4()
      ..salary = salary
      ..location = location;

    final jobs = Boxes.getJobs();
    jobs.add(job);
  }
}
