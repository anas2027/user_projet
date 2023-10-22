import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/wallet_getx/wallet_controller.dart';

import '../../../../core/constant/constants.dart';

class WalletPage extends StatelessWidget {
  WalletController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wallet'),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50).r,
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/wallet.png'),
              SizedBox(height: 50.h),
              Text(
                'Your balance : ',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              GetBuilder<WalletController>(
                builder: (controller) {
                  if(controller.wallet.isEmpty){
                    return Text('no wallet add');
                  }
                  else{
                    return  Text(
                  '${controller.wallet[0].funds} \$',
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                );
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
