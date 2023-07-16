import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class photoUpload extends StatefulWidget {
  const photoUpload({Key? key}) : super(key: key);

  @override
  _PhotoUploadState createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<photoUpload> {
  File? sampleImage;
  get picker => null;
  String? _myValue;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subir Producto"),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null ? Text("Select an Image") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Add Image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    var tempImage = await ImagePicker.platform.getImage(
        source: ImageSource.gallery,
        maxWidth: null,
        maxHeight: null,
        imageQuality: null,
        preferredCameraDevice: CameraDevice.rear);

    setState(() {
      sampleImage = File(tempImage!.path);
    });
  }

  Widget enableUpload() {
    return SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Image.file(
                    sampleImage!,
                    height: 300.0,
                    width: 600.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Description"),
                    validator: (value) {
                      return value!.isEmpty ? "Description is Required" : null;
                    },
                    onSaved: (value) => _myValue = value!,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    elevation: 10.0,
                    child: Text("Add a New Post"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: validateAndSave,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  bool validateAndSave() {
    final Form = formKey.currentState;
    if (Form!.validate()) {
      Form.save();
      return true;
    } else {
      return false;
    }
  }

  RaisedButton({required double elevation, required Text child, required Color textColor, required MaterialColor color, required bool Function() onPressed}) {}
}


