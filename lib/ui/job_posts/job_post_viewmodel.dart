import '../../hive/boxes.dart';
import '../../hive/job/job.dart';

class JobPostsViewModel {
  List<Job> getJobs() {
    return Boxes.getJobs().values.toList();
  }

  List<Job> getJobsFromCompany(String companyId) {
    final List<Job> jobs = [];
    for (int i = 0; i < getJobs().length; i++) {
      if (companyId == getJobs()[i].companyId) {
        jobs.add(getJobs()[i]);
      }
    }
    return jobs;
  }
}
