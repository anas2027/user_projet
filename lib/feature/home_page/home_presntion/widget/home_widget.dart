import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/home_getx/home_controller.dart';

import '../../../../core/constant/constants.dart';

Padding pharmaCardmethod(HomeController controller, int index) {
  return Padding(
    padding: const EdgeInsets.all(12).w,
    child: Stack(
      children: [
            SizedBox(
                        height: 50,
                         child: ListView(
                                       children: [
                                         SizedBox(
                                           height: 60,
                                           width: double.infinity,
                                           child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.changecurrentindex(index: index);
                                    controller.getWarehouseByCity(
                                        city: controller.cities[index]);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    width: 80,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: controller.currentindex == index
                                            ? Colors.white70
                                            : Colors.white54,
                                        borderRadius:
                                            controller.currentindex == index
                                                ? BorderRadius.circular(15)
                                                : BorderRadius.circular(10),
                                        border: controller.currentindex == index
                                            ? Border.all(
                                                color: Colors.teal,
                                                width: 4)
                                            : null),
                                    child: Center(
                                        child: TextDefault(
                                            maxLine: 1,
                                            colorText:
                                                controller.currentindex == index
                                                    ? Colors.teal
                                                    : Colors.tealAccent,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 15,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                controller.cities[index])),
                                  ),
                                ),
                                Visibility(
                                    visible: controller.currentindex == index,
                                    child: Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.teal),
                                    ))
                              ],
                            );
                          },
                          itemCount: controller.cities.length),
                                         ),
                                          ],
                                     ),
                       ),
      
        GestureDetector(
          onTap: () {
            Get.toNamed('/pharmacyHomePage',
                parameters: {'phId': '${controller.pharamacy[index].id}'});
            //     arguments: ['${controller.pharamacy[index].id}']);
          },
          child: Container(
            height: 210.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(30).w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    'assets/images/pharma.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 120.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0).w,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Pharmacy ${controller.pharamacy[index].name_ph}',
                                style: TextStyle(
                                    color: textColor, fontSize: 15.sp)),
                            Row(
                              children: [
                                Text('Phone : ',
                                    style: TextStyle(
                                        color: textColor, fontSize: 15.sp)),
                                Text('${controller.pharamacy[index].phone}',
                                    style: TextStyle(
                                        color: textColor, fontSize: 15.sp)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('City : ',
                                    style: TextStyle(
                                        color: textColor, fontSize: 15.sp)),
                                Text(controller.pharamacy[index].city,
                                    style: TextStyle(
                                        color: textColor, fontSize: 15.sp)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Street : ',
                                    style: TextStyle(
                                        color: textColor, fontSize: 15.sp)),
                                Text(controller.pharamacy[index].street,
                                    style: TextStyle(
                                        color: textColor, fontSize: 15.sp)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text('Online',
                          style: TextStyle(color: textColor, fontSize: 15.sp)),
                      // Text('online',
                      //     style: TextStyle(color: textColor, fontSize: 18)),
                    ],
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

Widget pharmaCard = Padding(
  padding: const EdgeInsets.all(12).w,
  child: Stack(
    children: [
      GestureDetector(
        onTap: () {
          // Get.to(
          //   const PharmaHomeView(),
          // );
        },
        child: Container(
          height: 210.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(30).w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(30)),
                child: Image.asset(
                  'assets/images/pharma.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0).w,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pharmacy 1',
                              style:
                                  TextStyle(color: textColor, fontSize: 15.sp)),
                          Row(
                            children: [
                              Text('Phone : ',
                                  style: TextStyle(
                                      color: textColor, fontSize: 15.sp)),
                              Text('0967564545',
                                  style: TextStyle(
                                      color: textColor, fontSize: 15.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('City : ',
                                  style: TextStyle(
                                      color: textColor, fontSize: 15.sp)),
                              Text('Damascus',
                                  style: TextStyle(
                                      color: textColor, fontSize: 15.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Street : ',
                                  style: TextStyle(
                                      color: textColor, fontSize: 15.sp)),
                              Text('Mazraa',
                                  style: TextStyle(
                                      color: textColor, fontSize: 15.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text('Online',
                        style: TextStyle(color: textColor, fontSize: 15.sp)),
                    // Text('online',
                    //     style: TextStyle(color: textColor, fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
