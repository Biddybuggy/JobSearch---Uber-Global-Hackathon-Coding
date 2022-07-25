import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:job_search/hive/application/application.dart';
import 'package:job_search/hive/company/company.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'app/myapp.dart';
import 'hive/job/job.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initDatabase();
  runApp(MyApp());
}

_initDatabase() async {
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(JobAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(ApplicationAdapter());

  await Hive.openBox<Job>(Job.tableName);
  await Hive.openBox<Company>(Company.tableName);
  await Hive.openBox<Application>(Application.tableName);
}
