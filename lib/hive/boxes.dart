import 'package:hive/hive.dart';
import 'package:job_search/hive/application/application.dart';
import 'package:job_search/hive/company/company.dart';

import 'job/job.dart';

class Boxes {
  static Box<Job> getJobs() => Hive.box<Job>(Job.tableName);

  static Box<Company> getCompanies() => Hive.box<Company>(Company.tableName);

  static Box<Application> getApplications() => Hive.box<Application>(Application.tableName);
}
