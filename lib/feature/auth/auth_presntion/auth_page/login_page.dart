import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/login.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_getx/login_getx/login_controller.dart';

import '../../../../core/constant/constants.dart';

class LoginPage extends StatelessWidget {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();

  LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // key: controller.loginFormKey,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 900,
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    child: Center(
                      child: Image(
                        image: const AssetImage('assets/images/logo.jpeg'),
                        height: 280.0.h,
                        width: 290.0.w,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.black, fontSize: 35.0.sp),
                ),
                SizedBox(height: 15.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: (value) {
                      if (GetUtils.isEmail(value!)) {
                        return null;
                      }
                      return "Enter valid email";
                    },
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                          gapPadding: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                          gapPadding: 10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                    child: Obx(
                      () => TextFormField(
                        controller: passwordController,
                        onSaved: (value) {
                          // controller.password=value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.grey,
                            onPressed: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30).w,
                              borderSide: const BorderSide(color: Colors.black),
                              gapPadding: 10.0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30).w,
                              borderSide: const BorderSide(color: Colors.black),
                              gapPadding: 10.0),
                        ),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      // Get.toNamed(Routes.SIGN_UP);
                    },
                    child: Text(
                      'Forget password ? ',
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10.0.h),
                Center(
                  child: FloatingActionButton.extended(
                      backgroundColor: mainColor,
                      foregroundColor: Colors.black,
                      label: const Text('Sign in'),
                      onPressed: () async {
                        Login login = Login(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString());
                        controller.login(login: login);
                      }),
                ),
                SizedBox(height: 50.0.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'New User?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          child: Text(
                            'click here',
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
