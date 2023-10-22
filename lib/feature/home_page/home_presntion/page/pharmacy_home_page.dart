import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_home_page_getx/pharmacy_home_page_controller.dart';

import '../../../../core/constant/constants.dart';
import '../widget/pharmacy_home_widget.dart';

class PharmacyHomePage extends StatelessWidget {
  PharmacyHomePageController controller = Get.find();
  var data = Get.parameters;
  @override
  Widget build(BuildContext context) {
    String phid = '${data['phId']}';

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              AppBar(
                leading: IconButton(
                    onPressed: () => Get.offAllNamed(
                          '/homePage',
                        ),
                    icon: Icon(Icons.arrow_back)),
                centerTitle: true,
                title: Text(
                  'PHARMA 1',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
                backgroundColor: mainColor,
                flexibleSpace: SizedBox(
                  height: 250.h,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        final result = showSearch(
                            context: context,
                            delegate: PharmacyHomeSearch(
                                med: controller.pharmacyMedcine,
                                controller: controller,
                                phId: phid));
                      },
                      icon: Icon(
                        Icons.search,
                        color: textColor,
                      )),
                ],
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 180, left: 12, right: 12).r,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30).w),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 40.w,
                                backgroundImage: const AssetImage(
                                    'assets/images/pharma.jpg'),
                              ),
                            ),
                            const Divider(),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('From '),
                                Text('12:00 '),
                                Text('to '),
                                Text('5:00'),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: const [
                                Expanded(
                                    child: Text(
                                  'Damascus',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                    child: Text(
                                  'Mazraa',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                Text(
                                  '0987878787',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.all(10).w,
            child: SizedBox(
              height: 180.h,
              child:
                  GetBuilder<PharmacyHomePageController>(builder: (controller) {
                if (controller.pharmacyMedcine.isEmpty) {
                  return Text('No Medcien in this pharmacy');
                } else {
                  return RefreshIndicator(
                    onRefresh: () => controller.getPharmacyMedcine(),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                              width: 160.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30).w,
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: SizedBox(height: 70,
                                            child: Image.network(
                                                                                  controller.pharmacyMedcine[index].image,
                                                                                  scale: 10,
                                                                                ),
                                          )),
                                      const Divider(),
                                      Center(
                                          child: Text(
                                        controller
                                            .pharmacyMedcine[index].name_med,
                                        style: TextStyle(color: textColor),
                                      )),
                                      Text(
                                          'quantity:${controller.pharmacyMedcine[index].quantity} '),
                                      Text(
                                          'mg:${controller.pharmacyMedcine[index].mg} '),
                                      Row(
                                        children: [
                                          const Text('exp : '),
                                          Text(controller
                                              .pharmacyMedcine[index].name_med),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          controller.pharmacyMedcine[index]
                                                      .status ==
                                                  1
                                              ? Text('Need a recipe')
                                              : Text('No recipe'),
                                          controller.pharmacyMedcine[index]
                                                      .status ==
                                                  1
                                              ? Icon(Icons.check)
                                              : Icon(Icons.close)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10.w),
                        itemCount: controller.pharmacyMedcine.length),
                  );
                }
              }),
            ),
          ),
          SizedBox(height: 30.h),
          Center(
            child: FloatingActionButton.extended(
                backgroundColor: mainColor,
                foregroundColor: Colors.black,
                label: const Text('Create Order'),
                onPressed: () async {
                  controller.createOrder();
                }),
          ),
        ],
      ),
    );
  }
}
