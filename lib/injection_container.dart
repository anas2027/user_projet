import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_repo_impl/auth_repo_impl.dart';
import 'package:user_final_project/feature/auth/auth_domain/repositry/auth_repo.dart';
import 'package:user_final_project/feature/auth/auth_domain/usecase/login_usecase.dart';
import 'package:user_final_project/feature/drawer/drawer_data/remote_data_souce/drawer_remote_data_source.dart';
import 'package:user_final_project/feature/drawer/drawer_data/repo_impl/drawer_repo_impl.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/repositry/drawer_repositry.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/get_racheta_image_usecase.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/get_wallet_usecase.dart';
import 'package:user_final_project/feature/home_page/home_data/remote_data_souce/home_remote_datasorce.dart';
import 'package:user_final_project/feature/home_page/home_data/repo_impl/home_repo_impl.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_medcine_need_rezpt_to_cart_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_medcine_tocart.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_product_tocart.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/confirm_order_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/delete_order_detail_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/get_cart_medcine_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/get_cart_product_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/send_rachet_image_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/create_order_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_med_pharmacy_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_pharmacy_by_city_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_pharmacy_product_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_pharmacy_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/search_medcine_usecase.dart';

import 'error/network/network_info.dart';
import 'feature/auth/auth_domain/usecase/register_usecase.dart';
import 'package:http/http.dart' as http;

import 'feature/drawer/drawer_domain/usecase/cansle_order_confirmation_usecase.dart';
import 'feature/drawer/drawer_domain/usecase/get_my_oder_usecase.dart';
import 'feature/home_page/home_domain/usecase/delete_order_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
// usecase

//////////////////////////////// AuthUseCase ///////////////////////////////////////
  sl.registerLazySingleton(() => LoginUseCase(auhtRepositry: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(auhtRepositry: sl()));

//////////////////////////////// Home Use CAse ///////////////////////////////////////
  sl.registerLazySingleton(() => GetPharmacyUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetMedPharmacyUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(
      () => GetPharmacyProductUseCase(homeRepositry: sl()));

  sl.registerLazySingleton(() => CreateOrderUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => DeleteOrderUsecase(homeRepositry: sl()));
  sl.registerLazySingleton(() => AddMedcineToCartUseCase(homeRepositry: sl()));
    sl.registerLazySingleton(() => GetPharmacyByCityUseCase(homeRepositry: sl()));
        sl.registerLazySingleton(() => SearchMedcineUseCase(homeRepositry: sl()));


  sl.registerLazySingleton(
      () => AddMecineNeedRezptToCartUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => AddProductToCartUseCase(homeRepositry: sl()));
//////////////////////////// cart usecase/////////////////////////////////////
  sl.registerLazySingleton(() => GetMedcineCartUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetProductCartUsecase(homeRepositry: sl()));
  sl.registerLazySingleton(() => ConfirmOrderUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => DeleteOrderDetailUseCase(homeRepositry: sl()));

    sl.registerLazySingleton(() => SendRachetaImageUseCase(homeRepositry: sl()));

///////////////////////////// drawer usecase/////////////////////////////////
  sl.registerLazySingleton(() => GetWalletUseCase(drawerRepositry: sl()));
  sl.registerLazySingleton(() => GetMyOrderUseCase(drawerRepositry: sl()));
  sl.registerLazySingleton(
      () => CansleOrderConfrimationUseCase(drawerRepositry: sl()));
       sl.registerLazySingleton(
      () => GetRachetaImageUsecase(drawerRepositry: sl()));

//Repositores

/////////////////////////// //////////Auth Repositry////////////////////////////
  sl.registerLazySingleton<AuhtRepositry>(
      () => AuthRepoImpl(authRemoteDataSorce: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepositry>(
      () => HomeRepositryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<DrawerRepositry>(
      () => DrawerRepoImpl(drawerRemoteDataSorce: sl(), networkInfo: sl()));
  // Datasource

/////////////////////////// ////////// remoteDatesourcce////////////////////////////

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<DrawerRemoteDataSorce>(
      () => DrawerRemoteDataSouceImpl(client: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));

  ////////////////////////////////  Home Remote

//sharedPrefrence
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //http

  sl.registerLazySingleton(() => http.Client());
  //internetconnectionchecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // file
  sl.registerLazySingleton(() => File(''));

//! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
}
