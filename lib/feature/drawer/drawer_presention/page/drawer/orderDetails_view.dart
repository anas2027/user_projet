
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/order_detail_getx/order_detail_controller.dart';

import '../../../../../core/constant/constants.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailController controller = Get.find();
  var data = Get.parameters;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String orderStatus = '${data['orderStatus']}';
    String orderid = '${data['orderid']}';
    String userStatus = '${data['userStatus']}';
       print(orderStatus);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15).r,
            child: Row(
              children: [
                Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: mainColor),
                  child: Image.asset(
                    'assets/images/pharma.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'AnasPharmacy',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 25.w),
                        Text(
                          '29/3/2023',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          '4 ',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'items',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    int.parse(orderStatus) == 0?
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        
                        child: IconButton(onPressed: () {
                          controller.confirmOrder(orderId: orderid);
                                  
                                }, icon: Icon(Icons.edit),color: Colors.grey,),
                      ): Text(''),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          '1000\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 110.w),
                        int.parse(orderStatus) == 1
                            ? const Text(
                                'Confirmed',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                'Waiting',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                           
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5).r,
                  child: Text(
                    'Order details',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                ),
                ////////////////////////   medcine lsit ?////////////////////////
                ///
                Text(
                  'Medcine details',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                SizedBox(
                  height: size.height * 0.2,
                  child: GetBuilder<OrderDetailController>(
                    builder: (controller) {
                      if (controller.orderMedcine.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'No Medcine on this order ',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: controller.orderMedcine.length,
                            itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: textColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        30), //<-- SEE HERE
                                  ),
                                  color: Colors.grey[200],
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.20,
                                        child: Image.network(
                                          controller.orderMedcine[index].image,
                                          scale: 8,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            controller
                                                .orderMedcine[index].name_med,
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: textColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              const Text('Quantity : '),
                                              Text(
                                                  '${controller.orderMedcine[index].quantity}'),
                                            ],
                                          )
                                        ],
                                      ),
                                     
                                    //    IconButton(onPressed: () async{
                                    //                                           controller.getrachitImage(orderDetailId: '${controller.orderMedcine[index].id}');
                                    //           // ImageGallerySaver.saveFile('http://192.168.1.5/My_pharmacy/myph/public/images/${controller.rachita[0].description}',isReturnPathOfIOS: false);
                                    //           //  GallerySaver.saveImage('http://192.168.1.5/My_pharmacy/myph/public/images/${controller.rachita[0].description}');
                                    //  controller.saveNetworkImage(orderDetailId: '${controller.orderMedcine[index].id}');
                                    //    }, icon: Icon(Icons.get_app)),
                                       
                                       controller.orderMedcine[index].status ==1?
                                        IconButton(onPressed: () {
                                                                                 controller.getrachitImage(orderDetailId: '${controller.orderMedcine[index].id}');

                                     
                                       }, 
                                       
                                       
                                       icon:Icon(Icons.image)):Text(''),
                                                                              controller.orderMedcine[index].status ==1?

                                      SizedBox(
                                        width: 20.w,
                                      ): SizedBox(
                                        width: 70.w,
                                      ),
                                       Text('${controller.orderMedcine[index].price_customer}\$'),
                                      int.parse(orderStatus) == 0
                                          ? IconButton(
                                              onPressed: () {
                                                print(orderStatus);
                                                int.parse(userStatus) == 0
                                                    ? controller.DeleteOrderDetail(
                                                        orderDetailId:
                                                            '${controller.orderMedcine[index].id}',
                                                        orderId: orderid)
                                                    : controller.confirmOrder(
                                                        orderId: orderid);
                                                controller.DeleteOrderDetail(
                                                    orderDetailId:
                                                        '${controller.orderMedcine[index].id}',
                                                    orderId: orderid);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                ));
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
                  height: size.height * 0.2,
                  child: GetBuilder<OrderDetailController>(
                    builder: (controller) {
                      if (controller.orderProduct.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'No Product on this order ',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: controller.orderProduct.length,
                            itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: textColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        30), //<-- SEE HERE
                                  ),
                                  color: Colors.grey[200],
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.25,
                                        child: Image.network(
                                          controller.orderProduct[index].images,
                                          scale: 8,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            child: TextDefault(
                                              contentText: controller.orderProduct[index].name,
                                              colorText: textColor,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 20,
                                              maxLine: 2,
                                              textOverflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Text('Quantity : '),
                                              Text(
                                                  '${controller.orderProduct[index].quantity}'),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      Text(
                                          '${controller.orderProduct[index].price} \$'),
                                      int.parse(orderStatus) == 0
                                          ? IconButton(
                                              onPressed: () {
                                                controller.DeleteOrderDetail(
                                                    orderDetailId:
                                                        '${controller.orderProduct[index].id}',
                                                    orderId: orderid);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
