import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:user_final_project/feature/home_page/home_data/model/med_pharmacy_model.dart';
import 'package:user_final_project/feature/home_page/home_data/model/medcine_search_model.dart';
import 'package:user_final_project/feature/home_page/home_data/model/pharmacy_model.dart';
import 'package:user_final_project/feature/home_page/home_data/model/pharmacy_product_model.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';

import '../../../../error/exception.dart';

abstract class HomeRemoteDataSource {
  Future<List<PharmacyModel>> getpharmacy();
  Future<List<MedPharmacyModel>> getMedPharmacy({required String phId});
  Future<List<PharmacyProductModel>> getPharmacyProduct({required String phId});
  Future<Unit> createOrder({required String phId, required String userId});
  Future<Unit> deleteOrder({required String orderId});
  Future<Unit> addmedcineToOrder({
    required String medId,
    required String qantityrequest,
    required String orderId,
  });
  Future<Unit> addproductToOrder({
    required String productId,
    required String qantityrequest,
    required String orderId,
  });

  Future<List<MedPharmacyModel>> getMedCart({required String orderId});
  Future<List<PharmacyProductModel>> getProductCart({required String orderId});
  Future<Unit> confirmOrder({required String orderId});
  Future<Unit> deleteOrderDetail(
      {required String orderDetailId, required String orderId});

      Future<Unit> sendRachetaImage({required String orderDetailId,required File image});
      Future<List<PharmacyModel>>getPharmacyByCity({required String city});
      Future<List<MedcineSearchModel>> getmedcinebysearch({required String name_med,required String city});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PharmacyModel>> getpharmacy() async {
    String url = 'http://10.0.2.2:8000/api/pharmacy';

    final response = await client.get(Uri.parse(url));
print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<PharmacyModel> myMedcineModels = decodeJson
          .map<PharmacyModel>((e) => PharmacyModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> createOrder(
      {required String phId, required String userId}) async {
    var body = {'id_ph': phId, 'id_user': userId};

    String url = 'http://10.0.2.2:8000/api/add/order/user';

    var response = await http
        .post(Uri.parse('http://10.0.2.2:8000/api/add/order/user'), body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var orderId = data['orders']['id'];
      print('this is order id $orderId');
      Get.toNamed('/PharmacyDetailPage',
          parameters: {"orderId": '$orderId', "phId": phId});
      Get.snackbar(
          'OrderCreated successful', 'You can Add med&product to cart');

      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MedPharmacyModel>> getMedPharmacy({required String phId}) async {
    String url = 'http://10.0.2.2:8000/api/get/med';

    final response = await client.post(Uri.parse(url), body: {'ph_id': phId});

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedPharmacyModel> myMedcineModels = decodeJson
          .map<MedPharmacyModel>((e) => MedPharmacyModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PharmacyProductModel>> getPharmacyProduct(
      {required String phId}) async {
    String url = 'http://10.0.2.2:8000/api/product?id=$phId';

    final response = await client.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<PharmacyProductModel> myMedcineModels = decodeJson
          .map<PharmacyProductModel>((e) => PharmacyProductModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteOrder({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/order/user/delete';
    var body = {'id': orderId};

    final response = await client.delete(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.offAllNamed('/homePage');

      Get.snackbar('Your Order  ', 'have been Deletes sucssufly');
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addmedcineToOrder(
      {required String medId,
      required String qantityrequest,
      required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/orderproduct';
    var body = {
      'order_id': orderId,
      'medid': medId,
      'qantityrequest': qantityrequest
    };
    print(body);
    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar('sucssufly', 'your medcine have been added to your cart ');
      return unit;
    } else {
      Get.snackbar('unsucssufly', 'your product have not added to your cart check your wallet');

      throw ServerException();
    }
  }

  @override
  Future<Unit> addproductToOrder(
      {required String productId,
      required String qantityrequest,
      required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/add/order/product';
    var body = {
      'order_id': orderId,
      'productid': productId,
      'qantityrequest': qantityrequest
    };
    print(body);
    print('addprodict');
    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar('sucssufly', 'your product have been added to your cart ');
      return unit;
    } else {
      Get.snackbar('unsucssufly', 'your product have not added to your cart ');

      throw ServerException();
    }
  }

  @override
  Future<Unit> confirmOrder({required String orderId}) async {
    var body = {'id': orderId};
    String url = 'http://10.0.2.2:8000/api/order/accepte/user';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.offAllNamed('/homePage');
      Get.snackbar('sucssufly', 'your product have been Confirmed ');
      return unit;
    } else {
      Get.snackbar(
          'unsucssufly', 'your product have not Confirmed check you internet ');

      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteOrderDetail(
      {required String orderDetailId, required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/delete/order/product';
    var body = {'id': orderDetailId};

    print('addprodict');
    final response = await client.delete(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar(
          'sucssufly', 'your product have been Deleted from your cart ');
      return unit;
    } else {
      Get.snackbar(
          'unsucssufly', 'your product have not Deleted from your cart ');

      throw ServerException();
    }
  }

  @override
  Future<List<MedPharmacyModel>> getMedCart({required String orderId}) async {
    var body = {'id': orderId};

    String url = 'http://10.0.2.2:8000/api/get/users/order/detail';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedPharmacyModel> myMedcineModels = decodeJson
          .map<MedPharmacyModel>((e) => MedPharmacyModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PharmacyProductModel>> getProductCart(
      {required String orderId}) async {
    var body = {'id': orderId};

    String url = 'http://10.0.2.2:8000/api/get/users/order/product';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<PharmacyProductModel> myMedcineModels = decodeJson
          .map<PharmacyProductModel>((e) => PharmacyProductModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<Unit> sendRachetaImage({required String orderDetailId, required File image}) async{

     String url = 'http://10.0.2.2:8000/api/add/description';
     var postUri = Uri.parse(url);
 var requset = http.MultipartRequest("POST",postUri);

 print('dadasaddas $image');
   String name = image.path.split(' \' ').first;
print('dadasaddas $name');
      String imagename = image.path.split('/').last;
      print('newimage $imagename');


 requset.files.add(
  await http.MultipartFile.fromPath('image',name)
 );
 requset.fields.addAll(
  {
    "id":orderDetailId
  }
 );
 var res = await requset.send();
 print(res.statusCode);
 print(res.request);
//  requset.fields['id']=orderDetailId;
//  requset.files.add(http.MultipartFile.fromBytes('description',await File.fromUri("$image").readAsBytes()));
if(res.statusCode == 200){
  return unit;
}
else {
  throw ServerException();
}
    // final response = await client.post(Uri.parse(url), body: body);
    //  if (response.statusCode == 200) {
     
    // Get.snackbar('your racheta added sucssuflu to order', 'pharmacy will see it ');

    //   return unit;
    // } else {
    //   throw ServerException();
    // }
  }
  
  @override
  Future<List<PharmacyModel>> getPharmacyByCity({required String city}) async{
    var body = {'city': city};

    String url = 'http://10.0.2.2:8000/api/pharmacy/city';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<PharmacyModel> myMedcineModels = decodeJson
          .map<PharmacyModel>((e) => PharmacyModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<List<MedcineSearchModel>> getmedcinebysearch({required String name_med, required String city}) async{
   var body = {'city': city,'name':name_med};

    String url = 'http://10.0.2.2:8000/api/search';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedcineSearchModel> myMedcineModels = decodeJson
          .map<MedcineSearchModel>((e) => MedcineSearchModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
}
