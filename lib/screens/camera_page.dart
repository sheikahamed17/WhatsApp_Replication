import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  late List<CameraDescription> cameras;
   late CameraController _cameraController;
   late List<dynamic> _galleryPhotos;

  @override
  void initState() {
    // TODO: implement initState
    _initializeCamera();
    super.initState();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    _cameraController.initialize().then((values) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> getImagesFromGallery()async {

  }

  @override
  Widget build(BuildContext context) {
    if(!_cameraController.value.isInitialized){
      return Container(width: 0.0,height: 0.0,);
    }
    return SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: CameraPreview(_cameraController),
                ),
                _cameraButtonWidget()
              ],
            )
        ));
  }
}

Widget _cameraButtonWidget() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.flash_on,color: Colors.white,size: 30,),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: Colors.white,width: 2)
            ),
          ),
          Icon(Icons.camera_alt,size: 30,)
        ],
      ),
    ),
  );
}
