import 'package:hive/hive.dart';

part 'company.g.dart';

@HiveType(typeId:1)
class Company extends HiveObject{
  static String tableName = "company";

  @HiveField(0)
  String? companyId;

  @HiveField(1)
  String? name;
}