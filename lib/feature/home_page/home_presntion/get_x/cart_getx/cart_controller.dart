import 'dart:convert';
import 'dart:io';


import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/confirm_order_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/delete_order_detail_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/get_cart_medcine_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/get_cart_product_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/cart/send_rachet_image_usecase.dart';

class CartController extends GetxController {
  ConfirmOrderUseCase confirmOrderUseCase;
  DeleteOrderDetailUseCase deleteOrderDetailUseCase;
  GetProductCartUsecase getProductCartUsecase;
  GetMedcineCartUseCase getMedcineCartUseCase;
  SendRachetaImageUseCase sendRachetaImageUseCase;
  CartController(
      {required this.confirmOrderUseCase,
      required this.deleteOrderDetailUseCase,
      required this.getMedcineCartUseCase,
      required this.getProductCartUsecase,
      required this.sendRachetaImageUseCase,
      required this.image});









      /////////////////////////////////////////////////Image Sendind
File image;
  final imagepicker = ImagePicker();
  bool imageloaded = false;
  UploadIage({required String orderDetailId}) async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);



    if (pickedimage != null) {
      File images = File(pickedimage.path);
      File imagechoose  = File(images.toString());
      String imagename = images.path.split('/').last;
         

      update();
               print('daadswegegeggeeg $imagename');

                sendRachetaImageUseCase(image: images,orderDetailId: orderDetailId);
 
      imageloaded = true;
    } else {
      update();

      imageloaded = false;
    }
  }



























  //////////////////////////////////////////////////////////////////////////////////////////////
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

  Future ConfirmOrder({required String orderId}) async {
    await confirmOrderUseCase(orderId: orderId);
  }

  Future DeleteOrderDetail(
      {required String orderDetailId, required String orderId}) async {
    await deleteOrderDetailUseCase(
        orderDetailId: orderDetailId, orderId: orderId);
  }



  
}
