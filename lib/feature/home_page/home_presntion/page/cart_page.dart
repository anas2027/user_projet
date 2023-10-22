import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/cart_getx/cart_controller.dart';

import '../../../../core/constant/constants.dart';
import '../widget/cart_widget.dart';

class CartPage extends StatelessWidget {
  CartController controller = Get.find();
  var data = Get.parameters;

  @override
  Widget build(BuildContext context) {
    String phId = '${data['phId']}';
    String orderid = '${data['orderid']}';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/PharmacyDetailPage',
                  parameters: {'orderId': orderid, 'phId': phId});
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: mainColor,
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15).r,
            child: Row(
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
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
                    Text(
                      'PHARMA 1',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '29/3/2023',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          'Quantity : ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Text(
                          '4',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Text('medcine cart item'),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5).r,
                  child: Text(
                    'medcine cart item',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 27.sp),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<CartController>(
                  builder: (controller) {
                    if (controller.orderMedcine.isEmpty) {
                      return Text('no medcine');
                    } else {
                      return  Expanded(
    child: ListView.builder(
        itemCount: controller.orderMedcine.length,
        itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(30), //<-- SEE HERE
              ),
              color: Colors.grey[200],
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Image.network(
                      controller.orderMedcine[index].image,
                      scale: 5,
                    ),
                  ),
                 
                  Column(
                    children: [
                      Text(
                        controller.orderMedcine[index].name_med,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text('Quantity : '),
                          Text('${controller.orderMedcine[index].quantity}'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                    controller.orderMedcine[index].status ==1?
                  IconButton(onPressed: () {
                    controller.UploadIage(orderDetailId: '${controller.orderMedcine[index].id}');
                  }, icon: Icon(Icons.camera)):
                  Text(''),

                  Text('${controller.orderMedcine[index].price_pharmacy}\$'),
                  IconButton(
                      onPressed: () {
                        controller.DeleteOrderDetail(
                            orderDetailId:
                                '${controller.orderMedcine[index].id}',
                            orderId: orderid);
                        controller.getmedcineorder(orderId:orderid);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                        size: 20.sp,
                      ))
                ],
              ),
            )),
  );

                  }}
                ),
                SizedBox(
                  height: 30,
                ),
                const Text(
                  'Product cart item',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<CartController>(
                  builder: (controller) {
                    if (controller.orderProduct.isEmpty) {
                      return Text('no Product');
                    } else {
                      print(controller.orderProduct);
                      print(controller.orderProduct[0].name);
                      return Expanded(
                        child: SizedBox(
                          height: 200,
                          child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(),
                              itemCount: controller.orderProduct.length,
                              itemBuilder: (context, index) => SizedBox(
                                    height: 80,
                                    child: Card(
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
                                            width: 90,
                                            child: Image.network(
                                              controller
                                                  .orderProduct[index].images,
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
                                                    .orderProduct[index].name,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: textColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Text('Quantity : '),
                                                  Text(
                                                      '${controller.orderProduct[index].quantity}'),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          Text(
                                              '${controller.orderProduct[index].price}\$'),
                                          IconButton(
                                              onPressed: () {
                                                controller.DeleteOrderDetail(
                                                    orderDetailId:
                                                        '${controller.orderProduct[index].id}',
                                                    orderId: orderid);
                                                controller.getorderproduct(
                                                    orderId: orderid);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.redAccent,
                                                size: 20.sp,
                                              ))
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'total Price : ',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '10000 \$',
                        style: TextStyle(fontSize: 20.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  GetBuilder<CartController>(
                    builder: (controller) => Center(
                      child: FloatingActionButton.extended(
                          backgroundColor: mainColor,
                          foregroundColor: Colors.black,
                          label: const Text('Confirm'),
                          onPressed: () async {
                            controller.ConfirmOrder(orderId: orderid);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
