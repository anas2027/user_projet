import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_getx/login_getx/login_binding.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_getx/register_getx/register_binding.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_page/login_page.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_page/register_page.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/account_getx/account_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/add_medcine_tocart_getx/add_medcine_tocart_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/edit_order_getx/edit_order_cart_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/medcine_list_order_getx/binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/my_order_cart_getx/my_order_cart_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/myorder_getx/my_order_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/order_detail_getx/order_detail_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/wallet_getx/wallet_binding.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/page/drawer/account_view.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/page/drawer/edit_my_order.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/page/drawer/edit_order_cart.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/page/drawer/edit_order_cart_page.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/page/drawer/ordersList_view.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/page/wallet_view.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/cart_getx/cart_binding.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/home_getx/home_binding.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/medcine_detail_getx/medcine_detail_binding.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/medcine_search_getx/medcine_search_binding.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_detail/pharmacy_detail_binding.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_home_page_getx/pharmacy_home_page_binding.dart';
import 'package:user_final_project/feature/home_page/home_presntion/page/cart_page.dart';
import 'package:user_final_project/feature/home_page/home_presntion/page/home_page.dart';
import 'package:user_final_project/feature/home_page/home_presntion/page/medcine_detail_page.dart';
import 'package:user_final_project/feature/home_page/home_presntion/page/medcine_searrch_page.dart';
import 'package:user_final_project/feature/home_page/home_presntion/page/pharmacy_detail_page.dart';
import 'package:user_final_project/feature/home_page/home_presntion/page/pharmacy_home_page.dart';
import 'feature/drawer/drawer_presention/page/drawer/medcine_list_order.dart';
import 'feature/drawer/drawer_presention/page/drawer/orderDetails_view.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
                name: '/', page: () => LoginPage(), binding: LoginBindings()),
            GetPage(
                name: '/register',
                page: () => RegisterPage(),
                binding: RegisterBinding()),
            GetPage(
                name: '/homePage',
                page: () => HomePage(),
                binding: HomeBinding()),
            GetPage(
                name: '/pharmacyHomePage',
                page: () => PharmacyHomePage(),
                binding: PharmacyHomePageBinding()),
            GetPage(
                name: '/PharmacyDetailPage',
                page: () => PharmacyDetailPage(),
                binding: PharmacyDetailBindinds()),
            GetPage(
                name: '/cartPage',
                page: () => CartPage(),
                binding: CartBinding()),

            GetPage(
                name: '/MedcineDetailPage',
                page: () => MedcineDetailPage(),
                binding: MedcineDetailBinding()),
            /////////////////////////////  Drawer ///////////////////////////////

            GetPage(
                name: '/AccountPage',
                page: () => AccountPage(),
                binding: AccountBinding()),
            GetPage(
                name: '/Myorder',
                page: () => MyOrderPage(),
                binding: MyOrderBinding()),
            GetPage(
                name: '/OrderDetailPage',
                page: () => OrderDetailPage(),
                binding: OrderDetailBinding()),
            GetPage(
                name: '/Wallet',
                page: () => WalletPage(),
                binding: WalletBinding()),
                GetPage(
                name: '/MedcineListOrder',
                page: () => MedcineListOrder(),
                binding: MedcineListOrderBinding()),
                 GetPage(
                name: '/EditOrderCart',
                page: () => EditOrderCart(),
                binding: EditOrderCartBinding()),
                 GetPage(
                name: '/EditMyOrder',
                page: () => EditMyOrder(),
                binding: addmedcineToOrderBinding()),
                 GetPage(
                name: '/MedcineSearchPage',
                page: () => MedcineSearchPage(),
                binding: MedcineSearchBinding()),
                 GetPage(
                name: '/MyOrderCartpage',
                page: () => MyOrderCartpage(),
                binding: MyOrderCartBinding()),
                //MyOrderCartBinding
          ],
        );
      },
    );
  }
}
