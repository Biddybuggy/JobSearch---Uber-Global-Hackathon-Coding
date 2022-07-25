import 'package:flutter/material.dart';
import 'package:job_search/hive/company/company.dart';
import 'package:job_search/hive/job/job.dart';
import 'package:job_search/resources/strings.dart';
import 'package:job_search/ui/comming_soon/comming_soon_view.dart';
import 'package:job_search/ui/home/home_view.dart';
import 'package:job_search/ui/job_add_form/add_job_form.dart';
import 'package:job_search/ui/job_post_detail/job_post_detail.dart';
import 'package:job_search/ui/job_posts/job_posts_view.dart';
import 'package:job_search/ui/login_choice/login_choice.dart';
import 'package:job_search/ui/login_form/login_form.dart';
import 'package:job_search/ui/profile/profile_view.dart';
import 'package:job_search/ui/register/register.dart';
import 'package:job_search/ui/splash/splash_view.dart';

import '../ui/companies/companies_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        );
      case LoginChoice.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginChoice(),
        );
      case RegisterView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RegisterView(),
        );
      case LoginForm.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => LoginForm(userType: (args as LoginFormArguments).userType),
        );
      case HomeView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );
      case CommingSoonView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CommingSoonView(),
        );
      case JobAddForm.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const JobAddForm(),
        );
      case CompaniesView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CompaniesView(companies: args as List<Company>),
        );
      case JobPostsView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => JobPostsView(companyId: args as String),
        );
      case JobPostDetailView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => JobPostDetailView(job: args as Job),
        );
      case ProfileView.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProfileView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
