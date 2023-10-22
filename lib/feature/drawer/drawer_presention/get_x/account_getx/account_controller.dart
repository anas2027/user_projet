import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountConrtoller extends GetxController {
  @override
  onInit() {
    super.onInit();
    GetUserInfo();
  }

  String username = '';
  String emai = '';
  String city = '';
  String street = '';
  String phone = '';

  GetUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = '${sharedPreferences.getString('userName')}';
    emai = '${sharedPreferences.getString('email')}';
    city = '${sharedPreferences.getString('city')}';
    street = '${sharedPreferences.getString('street')}';
    phone = '${sharedPreferences.getString('phone')}';
    print(username);
    update();
  }
}
