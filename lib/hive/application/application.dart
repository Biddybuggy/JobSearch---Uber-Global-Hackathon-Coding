import 'package:hive/hive.dart';

part 'application.g.dart';

@HiveType(typeId: 2)
class Application {
  static String tableName = "application";

  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? jobsId;
}
