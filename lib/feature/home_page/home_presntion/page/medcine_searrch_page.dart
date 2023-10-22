import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:user_final_project/core/constant/constants.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/medcine_search_getx/medcine_search_controller.dart';

class MedcineSearchPage extends StatelessWidget {
  MedcineSearchController controller = Get.find();
   var medcname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Column(
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
                                GetBuilder<MedcineSearchController>(
                                  builder: (controller) => 
                                   GestureDetector(
                                    onTap: () {
                                      controller.changecurrentindex(index: index);
                                      controller.getMedcineBySearch(
                                          city: controller.cities[index],name_med: medcname.text.toString());
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
      
          TextFormField(
controller:  medcname,
          ),
         
          GetBuilder<MedcineSearchController>(builder:(controller) {
            if(controller.medcsearch.isEmpty){
              return Text('search Medcine');
            }
            else{
              return Expanded(
                child: ListView.separated(itemBuilder: (context, index) => ListTile(
                  onTap: () => Get.offAllNamed('/pharmacyHomePage',parameters: {'phId':'${controller.medcsearch[index].id}'}),
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/images/logo.jpeg')),
                  title: TextDefault(maxLine: 1,
                   colorText:  Colors.grey, fontWeight:
                    FontWeight.bold,
                     fontsize: 30,
                      textOverflow: TextOverflow.ellipsis,
                       contentText: controller.medcsearch[index].name_ph),
                       subtitle: TextDefault(maxLine: 1,
                        
                        colorText:  Colors.black,
                         fontWeight: FontWeight.bold,
                          fontsize: 15,
                           textOverflow: TextOverflow.ellipsis,
                            contentText: '${controller.medcsearch[index].name_med} qunatity :${controller.medcsearch[index].quantity}'),
              trailing: TextDefault(maxLine: 3,
               colorText: Colors.black,
                fontWeight: FontWeight.bold,
                 fontsize: 15,
                  textOverflow: TextOverflow.ellipsis, 
                  contentText: 'price ${controller.medcsearch[index].price_customer} \n phone: ${controller.medcsearch[index].phone}'),
              
                ),
                 separatorBuilder:(context, index) =>  Divider(color: mainColor), 
                 itemCount: controller.medcsearch.length),
              );
            }
          },)
        ],
      ),
    );
  }
}