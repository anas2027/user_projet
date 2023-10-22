import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/rachita.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/cansle_order_confirmation_usecase.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/get_racheta_image_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/confirm_order_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/delete_order_detail_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/get_cart_medcine_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/get_cart_product_usecase.dart';

import '../../../../../error/failure.dart';
import '../../../../home_page/home_domain/entity/med_pharmacy.dart';
import '../../../../home_page/home_domain/entity/phamacy_product.dart';

class OrderDetailController extends GetxController {
  GetMedcineCartUseCase getMedcineCartUseCase;
  GetProductCartUsecase getProductCartUsecase;
  CansleOrderConfrimationUseCase cansleOrderConfrimationUseCase;
  ConfirmOrderUseCase confirmOrderUseCase;
  DeleteOrderDetailUseCase deleteOrderDetailUseCase;
  GetRachetaImageUsecase getRachetaImageUsecase;

  OrderDetailController(
      {required this.cansleOrderConfrimationUseCase,
      required this.getRachetaImageUsecase,
      required this.getMedcineCartUseCase,
      required this.deleteOrderDetailUseCase,
      required this.confirmOrderUseCase,
      required this.getProductCartUsecase});
  var data = Get.parameters;
  
  @override
  onInit() async {
    super.onInit();

    String orderid = '${data['orderid']}';
    await getmedcineorder(orderId: orderid);
    await getorderproduct(orderId: orderid);
  }

  //////////////////// get order product////////////////////////////
  List<PharmacyProduct> orderProduct = [];
  bool productbool = false;
  Future getorderproduct({required String orderId}) async {
    orderProduct.clear();
    var response = await getProductCartUsecase(orderId: orderId);
    response.fold((l) => Failure, (r) => orderProduct.addAll(r));
    productbool = true;
    update();
  }

  ////////////////////////////// get medcine order ///////////////////
  List<MedPharmacy> orderMedcine = [];
  bool medBool = false;

  Future getmedcineorder({required String orderId}) async {
    orderMedcine.clear();
    var response = await getMedcineCartUseCase(orderId: orderId);
    response.fold((l) => Failure, (r) => orderMedcine.addAll(r));
    medBool = true;
    update();
  }
String phid='9';
  Future confirmOrder({required String orderId}) async {

  //  if(orderMedcine.isNotEmpty){
  //   phid = '${orderMedcine[0].ph_id}';
  //  }
  //  else if(orderProduct.isNotEmpty){
  //   phid='${orderProduct[0].ph_id}';
  //  }
  //  else{
  //   phid='9';
  //  }


     String orderStatus = '${data['orderStatus']}';
    String orderid = '${data['orderid']}';
    String userStatus = '${data['userStatus']}';
  var response =  await cansleOrderConfrimationUseCase(orderId: orderId);
  response.fold((l) => Failure, (r) => Get.toNamed('/MedcineListOrder',parameters: {
                                    'phId':'$phid',
                                     'orderid':
                                                orderid,
                                            'orderStatus':
                                                orderStatus,
                                            'userStatus':
                                                userStatus
                                  }));
                                  update();
  }

  Future DeleteOrderDetail(
      {required String orderDetailId, required String orderId}) async {
    await confirmOrder(orderId: orderId);
    await deleteOrderDetailUseCase(
        orderDetailId: orderDetailId, orderId: orderId);
    await getmedcineorder(orderId: orderId);
    await getorderproduct(orderId: orderId);
  }
  //////////////////////////////// get orderDetail Image ///////////////////////////////////////////
  ///
  ///
  ///
  
  List<Rachita> rachita = [];
  getrachitImage({required String orderDetailId})async{
    rachita.clear()
;   var response= await getRachetaImageUsecase(id: orderDetailId);
   response.fold((l) => Failure, (r) => rachita.addAll(r));
   update();
      Get.defaultDialog(
  content:  Image.network('http://172.20.10.12/My_pharmacy/myph/public/images/${rachita[0].description}'),
  middleTextStyle: TextStyle(color: Colors.white),
  radius: 30
);
   print(rachita);
  }
        saveNetworkImage({required String orderDetailId}) async {
    var response = await Dio().get(
        "http://10.0.2.2:8000/api/get/description?id=$orderDetailId",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data[0]['description']),
        quality: 60,
        name: "hello");
        update();
    print(result);
  }
}
