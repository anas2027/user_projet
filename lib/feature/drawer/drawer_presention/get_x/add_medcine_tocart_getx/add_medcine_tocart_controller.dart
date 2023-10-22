
import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_medcine_tocart.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/add_product_tocart.dart';

class AddMedcineToCartController extends GetxController{
  AddMedcineToCartUseCase addMedcineToCartController;
  AddProductToCartUseCase addProductToCartUseCase;
 AddMedcineToCartController({required this.image,required this.addMedcineToCartController,required this.addProductToCartUseCase});


 addmedcineToOrder(
      {required String orderId,
      required String qantityrequest,
      required String medId}) async {
    await addMedcineToCartController(
        medId: medId, orderId: orderId, qantityrequest: qantityrequest);
  }

  addproductToOrder(
      {required String orderId,
      required String qantityrequest,
      required String productId}) async {
    return await addProductToCartUseCase(
        orderId: orderId, productId: productId, qantityrequest: qantityrequest);
  }
  RxNum defaultNumber = RxNum(1);
  var medicineRecipeStatus = 1.obs;
  File image;
  final imagepicker = ImagePicker();
  bool imageloaded = false;
  UploadIage() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      update();

      imageloaded = true;
    } else {
      update();

      imageloaded = false;
    }
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