import 'dart:async';

import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_medcine_tocart.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_product_tocart.dart';

class EditOrderCartCaontroller extends GetxController{
  AddMedcineToCartUseCase addMedcineToCartUseCase;
  AddProductToCartUseCase addProductToCartUseCase;
  EditOrderCartCaontroller({required this.addMedcineToCartUseCase,required this.addProductToCartUseCase});

  addMedcineTocart({required String orderId,required String medId,required String qantityrequest})async{
    await addMedcineToCartUseCase(medId:medId,orderId: orderId,qantityrequest: qantityrequest );
    
  }

  addProductToCart({required String orderId,required String productId,required String qantityrequest})async{
    addProductToCartUseCase(orderId: orderId,productId: productId,qantityrequest: qantityrequest);
  }
  Timer? timer;
  int counter = 1;
  @override
  onInit() {
    super.onInit();
     counter = 1;
  }
  void onLongPressSUm() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      counter++;
      update();
    });
  }

  void onLongPressSumCanscle() {
    update();
    timer?.cancel();
    update();
  }

  void countersum() {
    counter++;
    update();
  }
  // min counter

  void counterMin() {
    counter--;
    update();
  }

  void onLongPressMin() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      counter--;
      update();
    });
  }

  void onLongPressMinCanscle() {
    timer?.cancel();
  }

}