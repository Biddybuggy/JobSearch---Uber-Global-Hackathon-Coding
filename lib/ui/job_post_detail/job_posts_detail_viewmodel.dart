import 'package:job_search/hive/application/application.dart';
import 'package:job_search/resources/pref_contracts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../hive/boxes.dart';

class JobPostDetailViewModel {
  List<Application> getJobs() {
    return Boxes.getApplications().values.toList();
  }

  bool isJobAppliedAlready(String userId, String jobsId) {
    bool applied = false;
    for (int i = 0; i < getJobs().length; i++) {
      if (getJobs()[i].userId == userId && getJobs()[i].jobsId == jobsId) {
        applied = true;
        break;
      }
    }
    return applied;
  }

  Future<void> inputApplication(jobsId) async {
    final sharedPreference = await SharedPreferences.getInstance();
    String userId = sharedPreference.getString(PrefContracts.USER_NAME) ?? "";

    final application = Application()
    ..userId = userId
    ..jobsId = jobsId;

    final applications = Boxes.getApplications();
    applications.add(application);
  }
}
