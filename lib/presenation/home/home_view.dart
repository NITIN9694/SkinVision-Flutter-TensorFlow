import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skininfectiondetector/generated/assets.dart';
import 'package:skininfectiondetector/presenation/home/controller/home_controller.dart';
import 'package:lottie/lottie.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text_theme.dart';
class HomeView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
       Container(
         height: Get.height,
         child:  Obx(()=>
             controller.imagePath.value.isNotEmpty?
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(controller.imagePath.value),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.result.map((result) {
                  return Text(
                    "${result['labels']}",
                    style: const TextStyle(color: Colors.red,
                        fontSize: 20.0),
                  );
                }).toList(),
              )
            ],
          )
                 :   Stack(
           children: [

             Positioned(child:  Container(
               width: Get.width,
               height: 400,
               decoration: BoxDecoration(
                   color: ColorsTheme.col_24
               ),
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Lottie.asset('assets/uploadImage.json'),

                   ]
               ),
             ),),
             Positioned(
               top: 0,
               bottom: 0,
               left: 0,
               right: 0,

               child: InkWell(
                 onTap: (){
                   controller.getImage(ImageSource.gallery);
                 },
                 child: Container(
                   height: 20,
                   margin: EdgeInsets.symmetric(vertical: 380,
                       horizontal: 100
                   ),
                   width: 90,
                   decoration: BoxDecoration(
                     color: ColorsTheme.col_64,
                     borderRadius: BorderRadius.circular(40),

                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Image.asset(Assets.imagesPicUpload,
                         color: Colors.white,
                         height: 20,
                       ),
                       Text("Use Camera",
                         style: boldTextStyle(fontSize: 14.0, color: Colors.white),
                       )
                     ],
                   ),
                 ),
               ),
             ),
             Positioned(
               bottom: 190,
               child:  InkWell(
                 onTap: (){
                   controller.getImage(ImageSource.camera);
                 },
                 child: Container(
                   width: Get.width,
                   decoration: BoxDecoration(

                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.image,
                         size: 40,
                       ),
                       SizedBox(width: 10,),
                       Text("Select the image from Gallery",
                         style: mediumTextStyle(fontSize: 14.0, color: Colors.black),
                       )
                     ],
                   ),
                 ),
               ),),

           ],
         ),)
       )

    );
  }
  imagePickerBottomSheet() {
    return Get.bottomSheet(
      Container(
          padding: const EdgeInsets.only(top: 3),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            // borderRadius: BorderRadius.circular(10)
          ),
          child: Wrap(children: [
            Divider(thickness: 4.0, color: ColorsTheme.col_F6, indent: Get.width * 0.42, endIndent: Get.width * 0.42),
            Container(
              height: 5,
              margin: const EdgeInsets.only(top: 14),
              decoration: BoxDecoration(color: ColorsTheme.col_F6, borderRadius: const BorderRadius.only(topLeft: Radius.circular(13), topRight: Radius.circular(13))),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 21),
              decoration: BoxDecoration(
                color: ColorsTheme.colWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Image'.tr,
                    style: boldTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          controller.getImage(ImageSource.camera);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              Assets.imagesCamera,
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Camera'.tr,
                              style: regularTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          controller.getImage(ImageSource.gallery);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                            Assets.imagesGallery,
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Gallery'.tr,
                              style: regularTextStyle(fontSize: dimen14, color: ColorsTheme.colBlack),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ])),
    );
  }
}