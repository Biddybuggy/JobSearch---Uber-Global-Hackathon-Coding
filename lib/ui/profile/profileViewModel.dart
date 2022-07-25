import 'package:job_search/resources/pref_contracts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel{
  Future<String> getUserName() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString(PrefContracts.USER_NAME) ?? "";
  }

  Future<String> getUserType() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString(PrefContracts.USER_TYPE) ?? "";
  }
}