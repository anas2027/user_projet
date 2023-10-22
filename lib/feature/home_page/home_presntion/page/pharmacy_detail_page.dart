import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_detail/pharmacy_detail_controller.dart';
import 'package:user_final_project/feature/home_page/home_presntion/widget/pharmacy_detail_page_widget.dart';

import '../../../../core/constant/constants.dart';

class PharmacyDetailPage extends StatelessWidget {
  PharmacyDetailController controller = Get.find();
  var data = Get.parameters;
  @override
  Widget build(BuildContext context) {
    String orderId = '${data['orderId']}';
    String phId = '${data['phId']}';
    print(orderId);
    print(phId);
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
                productList(
                    context: context,
                    controller: controller,
                    orderId: orderId,
                    phId: phId),
                medcineList(
                    controller: controller,
                    orderId: orderId,
                    phId: phId,
                    context: context)
              ],
            )),
      ),
    );
    ;
  }
}
