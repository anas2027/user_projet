import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/myorder_getx/myorder_controller.dart';

import '../../../../../core/constant/constants.dart';

class MyOrderPage extends StatelessWidget {
  MyorderController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Get.offAllNamed('/homePage'), icon: Icon(Icons.arrow_back)),
          backgroundColor: mainColor,
          title: const Text('your orders'),
        ),
        body: GetBuilder<MyorderController>(
          builder: (controller) => Container(
            color: Colors.grey[200],
            child: ListView.builder(
                itemCount: controller.myorder.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10).w,
                      child: Container(
                        height: 170.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30).w),
                        child: Padding(
                          padding: const EdgeInsets.all(10).w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5).w,
                                    child: CircleAvatar(
                                      child: Image.asset(
                                          'assets/images/logo.jpeg'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    controller.myorder[index].name_ph,
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  const Text('4/5/2020'),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  int.parse('${controller.myorder[index].status}') ==0?
                                     IconButton(onPressed: () {
                                    controller.deleteOrder(orderId: '${controller.myorder[index].id}');
                                  }, icon: Icon(Icons.delete),color: Colors.red,):Text('')
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '${controller.myorder[index].total_price} \$',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    child: Expanded(
                                      child: Text(
                                        'See Details',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.toNamed('/OrderDetailPage',
                                          parameters: {
                                            'orderid':
                                                '${controller.myorder[index].id}',
                                            'orderStatus':
                                                '${controller.myorder[index].status}',
                                            'userStatus':
                                                '${controller.myorder[index].status_user}'
                                          });
                                    },
                                  ),
                              
                                  SizedBox(width: 150.w),
                                  controller.myorder[index].status == 0
                                      ? const Text(
                                          'Waiting',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const Text('Confirmed',style: TextStyle(
                                      fontWeight: FontWeight.bold),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ));
  }
}
