import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/register.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_getx/register_getx/register_controller.dart';

import '../../../../core/constant/constants.dart';

class RegisterPage extends StatelessWidget {
  RegisterConrtoller controller = Get.find();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final List<String> city = [
    'Damascus',
    'Hama',
    'Homs',
    'Idlib',
    'raqqa',
    'Aleppo',
    'Deir-Alzur',
    ' Lattakia',
    'Tartus'
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20).r,
          child: Column(children: [
            Expanded(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // key: controller.loginFormKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset('assets/images/logo.jpeg', scale: 5),
                    SizedBox(height: 20.0.h),
                    Center(
                      child: Text(
                        'Welcome to our App',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    TextFormField(
                      controller: nameController,
                      // onSaved: (value){
                      //   controller.fname=value!;
                      // },
                      // validator: (value){
                      //   return controller.validatefname(value!);
                      // },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: 'Name',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    TextFormField(
                      controller: emailController,
                      // onSaved: (value){
                      //   controller.email=value!;
                      // },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    TextFormField(
                      controller: passwordController,
                      // controller: controller.passwordController,
                      // onSaved: (value){
                      //   controller.password=value!;
                      // },
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    TextFormField(
                      controller: phoneNumberController,
                      // onSaved: (value){
                      //   controller.phone=value!;
                      // },
                      // validator: (value){
                      //   return controller.validatephone(value!);
                      // },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.phone_android,
                          color: Colors.black,
                        ),
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    TextFormField(
                      controller: streetController,
                      // onSaved: (value){
                      //   controller.phone=value!;
                      // },
                      // validator: (value){
                      //   return controller.validatephone(value!);
                      // },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        labelText: 'Street',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).w,
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    Obx(
                      () => Container(
                        height: 45.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30).w,
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(10).w,
                          child: DropdownButton<String>(
                              isExpanded: true,
                              value: controller.selectedItem.value == ""
                                  ? null
                                  : controller.selectedItem.value,
                              onChanged: (newValue) {
                                controller
                                    .updateSelectedItem(newValue.toString());
                                cityController.text = newValue.toString();
                              },
                              hint: const Text(
                                'choose your city',
                                style: TextStyle(color: Colors.black),
                              ),
                              items: city.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList()),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    Center(
                      child: FloatingActionButton.extended(
                          backgroundColor: mainColor,
                          foregroundColor: Colors.black,
                          label: const Text('Done'),
                          onPressed: () async {
                            UserRegister userRegister = UserRegister(
                                name_user: nameController.text.toString(),
                                email: emailController.text.toString(),
                                password: passwordController.text.toString(),
                                city_user: cityController.text.toString(),
                                street_user: streetController.text.toString(),
                                phone_user: int.parse(
                                    phoneNumberController.text.toString()));
                            controller.signUp(userRegister: userRegister);
                          }),
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
    ;
  }
}
