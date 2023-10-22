import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/account_getx/account_controller.dart';

import '../../../../../core/constant/constants.dart';

class AccountPage extends StatelessWidget {
  AccountConrtoller conrtoller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountConrtoller>(
      builder: (controller) => Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          title: const Text('your Account'),
          backgroundColor: mainColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20).r,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10).r,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person),
                        Text(
                          ' Name : ',
                          style: TextStyle(color: textColor, fontSize: 20.sp),
                        ),
                        Text(
                          conrtoller.username,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          Text(
                            ' Email : ',
                            style: TextStyle(color: textColor, fontSize: 20.sp),
                          ),
                          Text(
                            conrtoller.emai,
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        const Icon(Icons.location_city),
                        Text(
                          ' City : ',
                          style: TextStyle(color: textColor, fontSize: 20.sp),
                        ),
                        Text(
                          conrtoller.city,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        const Icon(Icons.streetview),
                        Text(
                          ' Street :  ',
                          style: TextStyle(color: textColor, fontSize: 20.sp),
                        ),
                        Text(
                          conrtoller.street,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        Text(
                          ' Phone : ',
                          style: TextStyle(color: textColor, fontSize: 20.sp),
                        ),
                        Text(
                          conrtoller.phone,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
