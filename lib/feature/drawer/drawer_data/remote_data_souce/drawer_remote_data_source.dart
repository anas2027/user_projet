import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:http/http.dart' as http;
import 'package:user_final_project/feature/drawer/drawer_data/model/myorder_model.dart';
import 'package:user_final_project/feature/drawer/drawer_data/model/rachit_model.dart';
import 'package:user_final_project/feature/drawer/drawer_data/model/wallet_model.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/rachita.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/wallet.dart';

import '../../../../error/exception.dart';

abstract class DrawerRemoteDataSorce {
  Future<List<WalletModel>> getWallet({required String userId});
  Future<List<MyorderModel>> getMyOrder({required String userId});
  Future<Unit> cansleOrderConfrimtion({required String orderId});
  Future<List<RachitaModel>> getRachitaImage({required String id});
}

class DrawerRemoteDataSouceImpl extends DrawerRemoteDataSorce {
  final http.Client client;

  DrawerRemoteDataSouceImpl({required this.client});
  @override
  Future<List<WalletModel>> getWallet({required String userId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var usderid= sharedPreferences.getString('userId');

    String url = 'http://10.0.2.2:8000/api/walletuser?user_id=$usderid';

    final response = await client.get(Uri.parse(url));
  
    if (response.statusCode == 200) {
      
      var wallet = jsonDecode(response.body);
      var walletuser = wallet[0]['funds'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('wallet', '${walletuser}');
      final List decodeJson = json.decode(response.body) as List;

      final List<WalletModel> myMedcineModels = decodeJson
          .map<WalletModel>((e) => WalletModel.fromJson(e))
          .toList();

      print(myMedcineModels);

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MyorderModel>> getMyOrder({required String userId}) async {
    String url = 'http://10.0.2.2:8000/api/view/order/users?id=$userId';

    final response = await client.get(Uri.parse(url));
print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MyorderModel> myMedcineModels = decodeJson
          .map<MyorderModel>((e) => MyorderModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> cansleOrderConfrimtion({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/order/accepte/user';

    final response = await client.post(Uri.parse(url), body: {'id': orderId});

    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<List<RachitaModel>> getRachitaImage({required String id})async {
   String url = 'http://10.0.2.2:8000/api/get/description?id=$id';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
       final List decodeJson = json.decode(response.body) as List;

      final List<RachitaModel> myMedcineModels = decodeJson
          .map<RachitaModel>((e) => RachitaModel.fromJson(e))
          .toList();
          return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
}
