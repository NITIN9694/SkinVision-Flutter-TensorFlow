import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

class HomeController extends GetxController{
  var imagePath = "".obs;
 late   CameraController _cameraController ;
  CameraController get cameraController=>_cameraController;
 var result = [].obs;
  var imageSelect=false.obs;


@override
void onInit() {
  loadModel();
  super.onInit();

}




  initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await cameraController.initialize();
  }

  getImage(ImageSource imageSource)async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile ? image = await imagePicker.pickImage(source: imageSource);
    if (image!.path.isNotEmpty) {
      imagePath.value = image.path;
    }
  }


  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model:"assets/tf/model_unquant.tflite",labels:"assets/tf/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
      result.value=recognitions!;

      imageSelect.value=true;
  }
}