import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/medcine_detail_getx/medcine_detail_controller.dart';

import '../../../../core/constant/constants.dart';

class MedcineDetailPage extends StatelessWidget {
  MedcineDetailController controller = Get.find();
  var data = Get.parameters;
  @override
  Widget build(BuildContext context) {
    String orderId = '${data['orderId']}';
    String phId = '${data['phId']}';
    String imageurl = '${data['imageurl']}';
    String medname = '${data['medname']}';
    String status = '${data['status']}';
    String descrption = '${data['descrption']}';
    String price = '${data['price']}';
    String quantity = '${data['quantity']}';
    String medId = '${data['medId']}';
    String productormed = '${data['productormed']}';
    print('add medcine $orderId');
    print('add medcine $medId');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/PharmacyDetailPage',
                  parameters: {'orderId': orderId, 'phId': phId});
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                '$imageurl',
                scale: 1,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    medname,
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                status == 1
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo, color: textColor))
                    : const SizedBox()
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'mg: $descrption ',
              style: TextStyle(fontSize: 25.sp, color: Colors.black),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  'quantity :',
                  style: TextStyle(fontSize: 21.sp, color: Colors.black),
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 21.sp, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  'Price : ',
                  style: TextStyle(fontSize: 21.sp, color: Colors.black),
                ),
                Text(
                  '$price',
                  style: TextStyle(fontSize: 21.sp, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  'Medicine Composition : ',
                  style: TextStyle(fontSize: 21.sp, color: Colors.black),
                ),
                Expanded(
                    child: Text(
                  'sdhffbbf',
                  style: TextStyle(fontSize: 21.sp, color: Colors.black),
                )),
              ],
            ),
            SizedBox(height: 20.h),
            GetBuilder<MedcineDetailController>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onLongPress: () => controller.counter == 0
                            ? null
                            : controller.onLongPressMin(),
                        onLongPressEnd: (p0) => controller.counter == 0
                            ? null
                            : controller.onLongPressMinCanscle(),
                        child: IconButton(
                            onPressed: () {
                              controller.counter == 0
                                  ? null
                                  : controller.counterMin();
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.teal,
                              size: 30,
                            )),
                      ),
                      TextDefault(
                          maxLine: 1,
                          colorText: Colors.tealAccent,
                          fontWeight: FontWeight.bold,
                          fontsize: 30,
                          textOverflow: TextOverflow.ellipsis,
                          contentText: '${controller.counter}'),
                      GestureDetector(
                        onLongPress: () => controller.onLongPressSUm(),
                        onLongPressEnd: (_) =>
                            controller.onLongPressSumCanscle(),
                        child: IconButton(
                            onPressed: () {
                              controller.countersum();
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.blue,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                ),
             
          
            Center(
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  label: const Text('Add to cart'),
                  onPressed: () async {
                    print(productormed);
                    int.parse(productormed) == 0
                        ? controller.addmedcineToOrder(
                            medId: medId,
                            qantityrequest: '${controller.counter}',
                            orderId: orderId,
                          )
                        : controller.addproductToOrder(
                            productId: medId,
                            qantityrequest: '${controller.counter}',
                            orderId: orderId,
                          );
                  }),
            ),
          ],
        ),
      ),
    );
    
  }
}
