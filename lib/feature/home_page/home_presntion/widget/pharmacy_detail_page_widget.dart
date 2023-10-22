import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/core/constant/constants.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_detail/pharmacy_detail_controller.dart';

Scaffold productList(
    {required PharmacyDetailController controller,
    required String orderId,
    required String phId,
    required BuildContext context}) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            controller.deleteOrder(orderId: orderId);
          },
          icon: Icon(Icons.arrow_back)),
      backgroundColor: mainColor,
      title: const Text('Pharma 1'),
      actions: [
        IconButton(
            onPressed: () {
              final result = showSearch(
                  context: context,
                  delegate: ProductSearch(
                      controller: controller,
                      product: controller.Product,
                      orderId: orderId,
                      phId: phId));
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Get.toNamed('/cartPage',
                  parameters: {'orderid': orderId, 'phId': phId});
            },
            icon: Icon(Icons.add_shopping_cart))
      ],
    ),
    body: TabBarView(children: [
      GetBuilder<PharmacyDetailController>(
        builder: (controller) {
          if (controller.Product.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed('/MedcineDetailPage', parameters: {
                    'orderId': orderId,
                    'medname': controller.Product[index].name,
                    'productormed': '1',
                    'phId': phId,
                    'medId': '${controller.Product[index].id}',
                    'quantity': '${controller.Product[index].quantity}',
                    'imageurl': controller.Product[index].images,
                    'status': '0',
                    'descrption': controller.Product[index].description,
                    'price': '${controller.Product[index].price}'
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
                                  Text('quantity : '),
                                  Text('${controller.Product[index].quantity}'),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                                controller.Product[index].images,
                                scale: 6))
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: controller.Product.length,
              separatorBuilder: (context, index) => SizedBox(),
            );
          }
        },
      )
    ]),
  );
}

Scaffold medcineList(
    {required BuildContext context,
    required PharmacyDetailController controller,
    required String orderId,
    required String phId}) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            controller.deleteOrder(orderId: orderId);
          },
          icon: Icon(Icons.arrow_back)),
      backgroundColor: mainColor,
      actions: [
        IconButton(
            onPressed: () {
              final result = showSearch(
                  context: context,
                  delegate: MedcineSearch(
                      controller: controller,
                      med: controller.pharmacyMedcine,
                      orderId: orderId,
                      phId: phId));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              Get.toNamed('/cartPage',
                  parameters: {'orderid': orderId, 'phId': phId});
            },
            icon: Icon(Icons.add_shopping_cart))
      ],
      title: const Text('Pharma 1'),
      bottom: const TabBar(
        isScrollable: true,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        labelColor: Colors.white,
        tabs: <Widget>[
          Tab(
            text: "Presun",
          ),
          Tab(
            text: "Afamia",
          ),
          Tab(
            text: "Augarit",
          ),
          Tab(
            text: "MMT",
          ),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        GetBuilder<PharmacyDetailController>(
          builder: (controller) {
            if (controller.pharmacyMedcine.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.toNamed('/MedcineDetailPage', parameters: {
                      'orderId': orderId,
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
                          '${controller.pharmacyMedcine[index].price_customer}'
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
                                 Row(
                                  children: [
                                    const Text('count : '),
                                    Text('${controller.pharmacyMedcine[index].quantity}'),
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
        )
      ],
    ),
  );
}

class MedcineSearch extends SearchDelegate<String> {
  List<MedPharmacy> med;

  PharmacyDetailController controller;
  String orderId;
  String phId;
  MedcineSearch({
    required this.orderId,
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
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              selectedItemColor: textColor,
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTabIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_information_outlined),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits),
                  label: 'Medicines',
                ),
              ],
            ),
          ),
          body: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            controller.deleteOrder(orderId: orderId);
                          },
                          icon: Icon(Icons.arrow_back)),
                      backgroundColor: mainColor,
                      title: const Text('Pharma 1'),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/cartPage', parameters: {
                                'orderid': orderId,
                                'phId': phId
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                    ),
                    body: TabBarView(children: [
                      GetBuilder<PharmacyDetailController>(
                        builder: (controller) {
                          if (controller.Product.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.separated(
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Get.toNamed('/MedcineDetailPage',
                                      parameters: {
                                        'orderId': orderId,
                                        'medname':
                                            controller.Product[index].name,
                                        'productormed': '1',
                                        'phId': phId,
                                        'medId':
                                            '${controller.Product[index].id}',
                                        'quantity':
                                            '${controller.Product[index].quantity}',
                                        'imageurl':
                                            controller.Product[index].images,
                                        'status': '0',
                                        'descrption': controller
                                            .Product[index].description,
                                        'price':
                                            '${controller.Product[index].price}'
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  Text('quantity : '),
                                                  Text(
                                                      '${controller.Product[index].quantity}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.network(
                                                controller
                                                    .Product[index].images,
                                                scale: 6))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: controller.Product.length,
                              separatorBuilder: (context, index) => SizedBox(),
                            );
                          }
                        },
                      )
                    ]),
                  ),
                  Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            controller.deleteOrder(orderId: orderId);
                          },
                          icon: Icon(Icons.arrow_back)),
                      backgroundColor: mainColor,
                      actions: [
                        IconButton(
                            onPressed: () {
                              final result = showSearch(
                                  context: context,
                                  delegate: MedcineSearch(
                                      controller: controller,
                                      med: controller.pharmacyMedcine,
                                      orderId: orderId,
                                      phId: phId));
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/cartPage', parameters: {
                                'orderid': orderId,
                                'phId': phId
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                      title: const Text('Pharma 1'),
                      bottom: const TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        labelColor: Colors.white,
                        tabs: <Widget>[
                          Tab(
                            text: "Presun",
                          ),
                          Tab(
                            text: "Afamia",
                          ),
                          Tab(
                            text: "Augarit",
                          ),
                          Tab(
                            text: "MMT",
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        GetBuilder<PharmacyDetailController>(
                          builder: (controller) {
                            if (controller.pharmacyMedcine.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/MedcineDetailPage',
                                        parameters: {
                                          'orderId': orderId,
                                          'medname': result[index].name_med,
                                          'productormed': '0',
                                          'phId': phId,
                                          'medId': '${result[index].id}',
                                          'quantity':
                                              '${result[index].quantity}',
                                          'imageurl': result[index].image,
                                          'status': '${result[index].status}',
                                          'descrption': '${result[index].mg}',
                                          'price':
                                              '${result[index].price_customer}'
                                        });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  result[index].name_med,
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: textColor),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('exp : '),
                                                    Text(result[index].exp),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    result[index].status == 1
                                                        ? Text('Need a recipe')
                                                        : Text('No recipe'),
                                                    controller
                                                                .pharmacyMedcine[
                                                                    index]
                                                                .status ==
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
                                              '${result[index].image}',
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
                                separatorBuilder: (context, index) =>
                                    SizedBox(),
                                itemCount: result.length,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              )),
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
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              selectedItemColor: textColor,
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTabIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_information_outlined),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits),
                  label: 'Medicines',
                ),
              ],
            ),
          ),
          body: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            controller.deleteOrder(orderId: orderId);
                          },
                          icon: Icon(Icons.arrow_back)),
                      backgroundColor: mainColor,
                      title: const Text('Pharma 1'),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/cartPage', parameters: {
                                'orderid': orderId,
                                'phId': phId
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                    ),
                    body: TabBarView(children: [
                      GetBuilder<PharmacyDetailController>(
                        builder: (controller) {
                          if (controller.Product.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.separated(
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Get.toNamed('/MedcineDetailPage',
                                      parameters: {
                                        'orderId': orderId,
                                        'medname':
                                            controller.Product[index].name,
                                        'productormed': '1',
                                        'phId': phId,
                                        'medId':
                                            '${controller.Product[index].id}',
                                        'quantity':
                                            '${controller.Product[index].quantity}',
                                        'imageurl':
                                            controller.Product[index].images,
                                        'status': '0',
                                        'descrption': controller
                                            .Product[index].description,
                                        'price':
                                            '${controller.Product[index].price}'
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  Text('quantity : '),
                                                  Text(
                                                      '${controller.Product[index].quantity}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.network(
                                                controller
                                                    .Product[index].images,
                                                scale: 6))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: controller.Product.length,
                              separatorBuilder: (context, index) => SizedBox(),
                            );
                          }
                        },
                      )
                    ]),
                  ),
                  Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            controller.deleteOrder(orderId: orderId);
                          },
                          icon: Icon(Icons.arrow_back)),
                      backgroundColor: mainColor,
                      actions: [
                        IconButton(
                            onPressed: () {
                              final result = showSearch(
                                  context: context,
                                  delegate: MedcineSearch(
                                      controller: controller,
                                      med: controller.pharmacyMedcine,
                                      orderId: orderId,
                                      phId: phId));
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/cartPage', parameters: {
                                'orderid': orderId,
                                'phId': phId
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                      title: const Text('Pharma 1'),
                      bottom: const TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        labelColor: Colors.white,
                        tabs: <Widget>[
                          Tab(
                            text: "Presun",
                          ),
                          Tab(
                            text: "Afamia",
                          ),
                          Tab(
                            text: "Augarit",
                          ),
                          Tab(
                            text: "MMT",
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        GetBuilder<PharmacyDetailController>(
                          builder: (controller) {
                            if (controller.pharmacyMedcine.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/MedcineDetailPage',
                                        parameters: {
                                          'orderId': orderId,
                                          'medname': result[index].name_med,
                                          'productormed': '0',
                                          'phId': phId,
                                          'medId': '${result[index].id}',
                                          'quantity':
                                              '${result[index].quantity}',
                                          'imageurl': result[index].image,
                                          'status': '${result[index].status}',
                                          'descrption': '${result[index].mg}',
                                          'price':
                                              '${result[index].price_customer}'
                                        });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  result[index].name_med,
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: textColor),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('exp : '),
                                                    Text(result[index].exp),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    result[index].status == 1
                                                        ? Text('Need a recipe')
                                                        : Text('No recipe'),
                                                    controller
                                                                .pharmacyMedcine[
                                                                    index]
                                                                .status ==
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
                                              '${result[index].image}',
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
                                separatorBuilder: (context, index) =>
                                    SizedBox(),
                                itemCount: result.length,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
    } else {
      return const Text('no medcine');
    }
  }
}

class ProductSearch extends SearchDelegate<String> {
  List<PharmacyProduct> product;

  PharmacyDetailController controller;
  String orderId;
  String phId;
  ProductSearch({
    required this.orderId,
    required this.controller,
    required this.phId,
    required this.product,
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
      final result = product
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return DefaultTabController(
          length: 4,
          child: Scaffold(
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                selectedItemColor: textColor,
                currentIndex: controller.tabIndex.value,
                onTap: controller.changeTabIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.medical_information_outlined),
                    label: 'Products',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.production_quantity_limits),
                    label: 'Medicines',
                  ),
                ],
              ),
            ),
            body: Obx(() => IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                            onPressed: () {
                              controller.deleteOrder(orderId: orderId);
                            },
                            icon: Icon(Icons.arrow_back)),
                        backgroundColor: mainColor,
                        title: const Text('Pharma 1'),
                        actions: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed('/cartPage', parameters: {
                                  'orderid': orderId,
                                  'phId': phId
                                });
                              },
                              icon: Icon(Icons.add_shopping_cart))
                        ],
                      ),
                      body: TabBarView(children: [
                        GetBuilder<PharmacyDetailController>(
                          builder: (controller) {
                            if (controller.Product.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/MedcineDetailPage',
                                        parameters: {
                                          'orderId': orderId,
                                          'medname': result[index].name,
                                          'productormed': '0',
                                          'phId': phId,
                                          'medId': '${result[index].id}',
                                          'quantity':
                                              '${result[index].quantity}',
                                          'imageurl': result[index].images,
                                          'status': '0',
                                          'descrption':
                                              result[index].description,
                                          'price': '${result[index].price}'
                                        });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  result[index].name,
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: textColor),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('quantity : '),
                                                    Text(
                                                        '${result[index].quantity}'),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Image.network(
                                                  result[index].images,
                                                  scale: 6))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: controller.Product.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(),
                              );
                            }
                          },
                        )
                      ]),
                    ),
                    Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                            onPressed: () {
                              controller.deleteOrder(orderId: orderId);
                            },
                            icon: Icon(Icons.arrow_back)),
                        backgroundColor: mainColor,
                        actions: [
                          IconButton(
                              onPressed: () {
                                final result = showSearch(
                                    context: context,
                                    delegate: MedcineSearch(
                                        controller: controller,
                                        med: controller.pharmacyMedcine,
                                        orderId: orderId,
                                        phId: phId));
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.toNamed('/cartPage', parameters: {
                                  'orderid': orderId,
                                  'phId': phId
                                });
                              },
                              icon: Icon(Icons.add_shopping_cart))
                        ],
                        title: const Text('Pharma 1'),
                        bottom: const TabBar(
                          isScrollable: true,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          labelColor: Colors.white,
                          tabs: <Widget>[
                            Tab(
                              text: "Presun",
                            ),
                            Tab(
                              text: "Afamia",
                            ),
                            Tab(
                              text: "Augarit",
                            ),
                            Tab(
                              text: "MMT",
                            ),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          GetBuilder<PharmacyDetailController>(
                            builder: (controller) {
                              if (controller.pharmacyMedcine.isEmpty) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return ListView.separated(
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/MedcineDetailPage',
                                          parameters: {
                                            'orderId': orderId,
                                            'medname': controller
                                                .pharmacyMedcine[index]
                                                .name_med,
                                            'productormed': '0',
                                            'phId': phId,
                                            'medId':
                                                '${controller.pharmacyMedcine[index].id}',
                                            'quantity':
                                                '${controller.pharmacyMedcine[index].quantity}',
                                            'imageurl': controller
                                                .pharmacyMedcine[index].image,
                                            'status':
                                                '${controller.pharmacyMedcine[index].status}',
                                            'descrption':
                                                '${controller.pharmacyMedcine[index].mg}',
                                            'price':
                                                '${controller.pharmacyMedcine[index].price_customer}'
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .pharmacyMedcine[index]
                                                        .name_med,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: textColor),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text('exp : '),
                                                      Text(controller
                                                          .pharmacyMedcine[
                                                              index]
                                                          .exp),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      controller
                                                                  .pharmacyMedcine[
                                                                      index]
                                                                  .status ==
                                                              1
                                                          ? Text(
                                                              'Need a recipe')
                                                          : Text('No recipe'),
                                                      controller
                                                                  .pharmacyMedcine[
                                                                      index]
                                                                  .status ==
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(),
                                  itemCount: result.length,
                                );
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ));
    } else {
      return const Text('no medcine');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      final result = product
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              selectedItemColor: textColor,
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTabIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_information_outlined),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits),
                  label: 'Medicines',
                ),
              ],
            ),
          ),
          body: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            controller.deleteOrder(orderId: orderId);
                          },
                          icon: Icon(Icons.arrow_back)),
                      backgroundColor: mainColor,
                      title: const Text('Pharma 1'),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/cartPage', parameters: {
                                'orderid': orderId,
                                'phId': phId
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                    ),
                    body: TabBarView(children: [
                      GetBuilder<PharmacyDetailController>(
                        builder: (controller) {
                          if (controller.Product.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.separated(
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Get.toNamed('/MedcineDetailPage',
                                      parameters: {
                                        'orderId': orderId,
                                        'medname': result[index].name,
                                        'productormed': '1',
                                        'phId': phId,
                                        'medId': '${result[index].id}',
                                        'quantity': '${result[index].quantity}',
                                        'imageurl': result[index].images,
                                        'status': '0',
                                        'descrption': result[index].description,
                                        'price': '${result[index].price}'
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                result[index].name,
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
                                                  Text('quantity : '),
                                                  Text(
                                                      '${result[index].quantity}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.network(
                                                result[index].images,
                                                scale: 6))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: result.length,
                              separatorBuilder: (context, index) => SizedBox(),
                            );
                          }
                        },
                      )
                    ]),
                  ),
                  Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          onPressed: () {
                            controller.deleteOrder(orderId: orderId);
                          },
                          icon: Icon(Icons.arrow_back)),
                      backgroundColor: mainColor,
                      actions: [
                        IconButton(
                            onPressed: () {
                              final result = showSearch(
                                  context: context,
                                  delegate: MedcineSearch(
                                      controller: controller,
                                      med: controller.pharmacyMedcine,
                                      orderId: orderId,
                                      phId: phId));
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/cartPage', parameters: {
                                'orderid': orderId,
                                'phId': phId
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                      title: const Text('Pharma 1'),
                      bottom: const TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        labelColor: Colors.white,
                        tabs: <Widget>[
                          Tab(
                            text: "Presun",
                          ),
                          Tab(
                            text: "Afamia",
                          ),
                          Tab(
                            text: "Augarit",
                          ),
                          Tab(
                            text: "MMT",
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        GetBuilder<PharmacyDetailController>(
                          builder: (controller) {
                            if (controller.pharmacyMedcine.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/MedcineDetailPage',
                                        parameters: {
                                          'orderId': orderId,
                                          'medname': controller
                                              .pharmacyMedcine[index].name_med,
                                          'productormed': '0',
                                          'phId': phId,
                                          'medId':
                                              '${controller.pharmacyMedcine[index].id}',
                                          'quantity':
                                              '${controller.pharmacyMedcine[index].quantity}',
                                          'imageurl': controller
                                              .pharmacyMedcine[index].image,
                                          'status':
                                              '${controller.pharmacyMedcine[index].status}',
                                          'descrption':
                                              '${controller.pharmacyMedcine[index].mg}',
                                          'price':
                                              '${controller.pharmacyMedcine[index].price_customer}'
                                        });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .pharmacyMedcine[index]
                                                      .name_med,
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: textColor),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('exp : '),
                                                    Text(controller
                                                        .pharmacyMedcine[index]
                                                        .exp),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    controller
                                                                .pharmacyMedcine[
                                                                    index]
                                                                .status ==
                                                            1
                                                        ? Text('Need a recipe')
                                                        : Text('No recipe'),
                                                    controller
                                                                .pharmacyMedcine[
                                                                    index]
                                                                .status ==
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
                                separatorBuilder: (context, index) =>
                                    SizedBox(),
                                itemCount: controller.pharmacyMedcine.length,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
    } else {
      return const Text('no medcine');
    }
  }
}
