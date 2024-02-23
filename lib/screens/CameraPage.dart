import 'package:fashionapp/functions/imagePickAlert.dart';
import 'package:fashionapp/screens/InfoPage1.dart';
import '../recognition/MLKitTextRecognizer.dart';
import '../recognition/RecognitionResponse.dart';
import '../recognition/textRecognizer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  late ImagePicker _picker;
  late ITextRecognizer _recognizer;

  RecognitionResponse? _response;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();

    _recognizer = MLKitTextRecognizer();
  }

  @override
  void dispose() {
    super.dispose();
    if (_recognizer is MLKitTextRecognizer) {
      (_recognizer as MLKitTextRecognizer).dispose();
    }
  }

  void processImage(String imgPath) async {
    final recognizedText = await _recognizer.processImage(imgPath);
    setState(() {
      _response = RecognitionResponse(
        imgPath: imgPath,
        recognizedText: recognizedText,
      );
    });
  }

  Future<String?> obtainImage(ImageSource source) async {
    final file = await _picker.pickImage(source: source);
    return file?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PANDRIP',
          style: GoogleFonts.pacifico(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFF2E8CF),
      ),
      extendBodyBehindAppBar: true,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => imagePickAlert(
              onCameraPressed: () async {
                final imgPath = await obtainImage(ImageSource.camera);
                if (imgPath == null) return;
                //Navigator.of(context).pop();
                processImage(imgPath);
                Navigator.push(context, MaterialPageRoute(builder:(context) => InfoPage1(_response!.recognizedText)));
              },
              onGalleryPressed: () async {
                final imgPath = await obtainImage(ImageSource.gallery);
                if (imgPath == null) return;
                //Navigator.of(context).pop();
                processImage(imgPath);
                Navigator.push(context, MaterialPageRoute(builder:(context) => InfoPage1(_response!.recognizedText)));
              },
            ),
          );
        },
        backgroundColor: const Color(0xFF6A994E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60), //角の丸み
        ),
        child: const Icon(Icons.camera_alt, color:Colors.white),
        //label: const Text("Scan"),
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: null),
            IconButton(icon: Icon(Icons.history), onPressed: null,)
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Container(
                padding: const EdgeInsets.only(top:80),
                child: Image.asset('./images/panda.png'),
              ),
              Container(
                padding: const EdgeInsets.only(left:50, right:50, bottom: 50),
                child: Text("Pandrip is a mobile app that brings awareness about the environmental impact of your clothing purchases.\n"
                    "\n"
                    "Usage: \n"
                    "① Use the camera on your phone\n"
                    "② Scan the label of your clothes\n"
                    "③ app will provide the user with information about the sustainability of the product/brand\n",
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),),
              )
            ]
          ),
        ),
      ),
    );
  }
}
