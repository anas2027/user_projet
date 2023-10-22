// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/home_getx/home_controller.dart';

import '../../../../core/constant/constants.dart';
import '../widget/home_widget.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.find();
  
  List cities = [
    'Damascus',
    'Latakia',
    'Ṭartus',
    'Homs',
    'Ḥamāh',
    'Idlib',
    'Maʿlula',
    'Palmyra',
    'Al-Ḥasakah',
    'Darʿā',
    'Aleppo',
    'Al-Ḥasakah',
    'Al-Qāmishlī',
    'Al-Qunayṭirah',
    'Al-Raqqah',
    'Al-Suwayda'
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.toNamed('/MedcineSearchPage');
        },backgroundColor: mainColor,child: Icon(Icons.search),),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: mainColor,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile.png',
                        scale: 10,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Anas',
                        style: TextStyle(fontSize: 20.sp),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/profile.png',
                    scale: 18,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Account',
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.toNamed('/AccountPage');
                    // Get.to(const AccountView());
                  },
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: Text('My orders',
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Get.toNamed('/Myorder');

                    // Get.to(() => const OrderListView());
                  },
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.wallet),
                  title: Text('Wallet',
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Get.toNamed('/Wallet');
                    // Get.to(const WalletView());
                  },
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text('Logout',
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Get.offAllNamed('/');
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(

            backgroundColor: mainColor,
          ),
          body: GetBuilder<HomeController>(
            builder: (controller) {
              if (controller.pharamacy.isEmpty) {
                return Column(
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
      
                    const Center(child: CircularProgressIndicator()),
                  ],
                );
              } else {
                return Column(
                  
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
      
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            pharmaCard = pharmaCardmethod(controller, index),
                        itemCount: controller.pharamacy.length,
                        separatorBuilder: (context, index) => SizedBox(),
                      ),
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}
