import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constants.dart';
import '../../home_domain/entity/med_pharmacy.dart';
import '../get_x/pharmacy_home_page_getx/pharmacy_home_page_controller.dart';

class PharmacyHomeSearch extends SearchDelegate<String> {
  List<MedPharmacy> med;

  PharmacyHomePageController controller;
  String phId;
  PharmacyHomeSearch({
    required this.controller,
    required this.phId,
    required this.med,
  });
  String image =
      'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg';

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.teal,
            size: 30,
          ),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name_med.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
                        onPressed: () {},
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    'Mazraa',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Text(
                                    '0987878787',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                child: GetBuilder<PharmacyHomePageController>(
                    builder: (controller) {
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
                                            child: Image.network(
                                          result[index].image,
                                          scale: 10,
                                        )),
                                        const Divider(),
                                        Center(
                                            child: Text(
                                          result[index].name_med,
                                          style: TextStyle(color: textColor),
                                        )),
                                        Text(
                                            'quantity:${result[index].quantity} '),
                                        Text('mg:${result[index].mg} '),
                                        Row(
                                          children: [
                                            const Text('exp : '),
                                            Text(result[index].name_med),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            result[index].status == 1
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
                          itemCount: result.length),
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
    } else {
      return const Text('no medcine');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name_med.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
                        onPressed: () {},
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    'Mazraa',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Text(
                                    '0987878787',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                child: GetBuilder<PharmacyHomePageController>(
                    builder: (controller) {
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
                                            child: Image.network(
                                          result[index].image,
                                          scale: 10,
                                        )),
                                        const Divider(),
                                        Center(
                                            child: Text(
                                          result[index].name_med,
                                          style: TextStyle(color: textColor),
                                        )),
                                        Text(
                                            'quantity:${result[index].quantity} '),
                                        Text('mg:${result[index].mg} '),
                                        Row(
                                          children: [
                                            const Text('exp : '),
                                            Text(result[index].name_med),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            result[index].status == 1
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
                          itemCount: result.length),
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
    } else {
      return const Text('no medcine');
    }
  }
}
