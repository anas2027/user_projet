import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/core/constant/constants.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/medcine_list_order_getx/controller.dart';

class MedcineListOrder extends StatelessWidget {
  MedcineListOrderController controller = Get.find();
  var data  = Get.parameters;
  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;

     String orderStatus = '${data['orderStatus']}';
    String orderid = '${data['orderid']}';
    String userStatus = '${data['userStatus']}';
    String  phId = '${data['phId']}';
    print('daw $phId');
    return Scaffold(
   appBar: AppBar(
    actions: [IconButton(onPressed: (){
      Get.toNamed('/MyOrderCartpage',parameters: {
        "orderStatus":orderStatus,
        "orderid":orderid,
        "userStatus":userStatus,
        "phId":phId

      });
    }, icon: Icon(Icons.shopping_cart_outlined))],
    leading: IconButton(onPressed: () {
      print(orderStatus);
      print(userStatus);
      print(phId);
      print(orderid);
      controller.confirmOrder(orderId: orderid);
     }, icon: Icon(Icons.arrow_back)),
    backgroundColor: mainColor,
   ), 
   body: Column(
     children: [
       Text(
                  'Medcine details',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
       SizedBox(
        height: size.height*0.3,
         child: GetBuilder<MedcineListOrderController>(
           builder: (controller) {
             if (controller.pharmacyMedcine.isEmpty) {
               return Center(child: CircularProgressIndicator());
             } else {
               return ListView.separated(
                 itemBuilder: (context, index) => GestureDetector(
                   onTap: () {
                    Get.toNamed('/EditMyOrder',parameters: {
                       'orderId': orderid,
                      'medname': controller.pharmacyMedcine[index].name_med,
                      'productormed': '0',
                      'phId': phId,
                      'medId': '${controller.pharmacyMedcine[index].id}',
                      'quantity':
                          '${controller.pharmacyMedcine[index].quantity}',
                      'imageurl': controller.pharmacyMedcine[index].image,
                      'status': '${controller.pharmacyMedcine[index].status}',
                      'descrption': '${controller.pharmacyMedcine[index].mg}',
                      'price':
                          '${controller.pharmacyMedcine[index].price_customer}',
                          'orderStatus':orderStatus,
                          'userStatus':userStatus
                    });
                   },
                   child: Container(
                     decoration:
                         BoxDecoration(borderRadius: BorderRadius.circular(30)),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   controller.pharmacyMedcine[index].name_med,
                                   style: TextStyle(
                                       fontSize: 20.sp,
                                       fontWeight: FontWeight.bold,
                                       color: textColor),
                                 ),
                                 SizedBox(
                                   height: 5.h,
                                 ),
                                 Row(
                                   children: [
                                     const Text('exp : '),
                                     Text(controller.pharmacyMedcine[index].exp),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 Row(
                                   children: [
                                     controller.pharmacyMedcine[index].status ==
                                             1
                                         ? Text('Need a recipe')
                                         : Text('No recipe'),
                                     controller.pharmacyMedcine[index].status ==
                                             1
                                         ? Icon(Icons.check)
                                         : Icon(Icons.close)
                                   ],
                                 )
                               ],
                             ),
                           ),
                           SizedBox(
                             width: 100,
                             child: Image.network(
                               '${controller.pharmacyMedcine[index].image}',
                               scale: 6,
                               width: 50,
                               height: 50,
                             ),
                           )
                         ],
                       ),
                     ),
                   ),
                 ),
                 separatorBuilder: (context, index) => SizedBox(),
                 itemCount: controller.pharmacyMedcine.length,
               );
             }
           },
         ),
       ),
          Text(
                  'Product details',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                  SizedBox(
        height: size.height*0.3,
         child: GetBuilder<MedcineListOrderController>(
           builder: (controller) {
             if (controller.pharmacyMedcine.isEmpty) {
               return Center(child: CircularProgressIndicator());
             } else {
               return ListView.separated(
                 itemBuilder: (context, index) => GestureDetector(
                   onTap: () {
                    Get.toNamed('/EditMyOrder',parameters: {
                      'orderId': orderid,
                    'medname': controller.Product[index].name,
                    'productormed': '1',
                    'phId': phId,
                    'medId': '${controller.Product[index].id}',
                    'quantity': '${controller.Product[index].quantity}',
                    'imageurl': controller.Product[index].images,
                    'status': '0',
                    'descrption': controller.Product[index].description,
                    'price': '${controller.Product[index].price}',
                     'orderStatus':orderStatus,
                          'userStatus':userStatus
                    });
                   },
                   child: Container(
                     decoration:
                         BoxDecoration(borderRadius: BorderRadius.circular(30)),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   controller.Product[index].name,
                                   style: TextStyle(
                                       fontSize: 20.sp,
                                       fontWeight: FontWeight.bold,
                                       color: textColor),
                                 ),
                                 SizedBox(
                                   height: 5.h,
                                 ),
                                 Row(
                                   children: [
                                     const Text('exp : '),
                                     Text(controller.Product[index].description),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                ],
                             ),
                           ),
                           SizedBox(
                             width: 100,
                             child: Image.network(
                               '${controller.Product[index].images}',
                               scale: 6,
                               width: 50,
                               height: 50,
                             ),
                           )
                         ],
                       ),
                     ),
                   ),
                 ),
                 separatorBuilder: (context, index) => SizedBox(),
                 itemCount: controller.Product.length,
               );
             }
           },
         ),
       ),
  
      
     ],
   ),
  );
}
}