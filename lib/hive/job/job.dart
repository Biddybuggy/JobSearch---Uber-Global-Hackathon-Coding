import 'package:hive/hive.dart';

part 'job.g.dart';

@HiveType(typeId: 0)
class Job extends HiveObject {
  static String tableName = "job";

  @HiveField(0)
  String? jobId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? companyId;

  @HiveField(4)
  String? salary;

  @HiveField(5)
  String? location;
}
