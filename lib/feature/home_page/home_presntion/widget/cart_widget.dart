import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/cart_getx/cart_controller.dart';

import '../../../../core/constant/constants.dart';

Expanded medcinecart(
    {required CartController controller, required String orderId}) {
  return Expanded(
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
                  SizedBox(
                    width: 4.w,
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
                    width: 90.w,
                  ),
                  Text('${controller.orderMedcine[index].price_pharmacy}\$'),
                  IconButton(
                      onPressed: () {
                        controller.DeleteOrderDetail(
                            orderDetailId:
                                '${controller.orderMedcine[index].id}',
                            orderId: orderId);
                        controller.getmedcineorder(orderId: orderId);
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
}
