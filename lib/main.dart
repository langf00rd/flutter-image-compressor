import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:flutter_image_compress/flutter_image_compress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Compress image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  File? _thumbnail;

  final ImagePicker _picker = ImagePicker();

  _chooseImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      // imageQuality: 10,
    );

    setState(() {
      _image = File(image!.path);
    });

    testCompressAndGetFile();
  }

  Future<File?> testCompressAndGetFile() async {
    File compressedFile = await FlutterNativeImage.compressImage(_image!.path,
        quality: 20, targetWidth: 300, targetHeight: 130);

    setState(() {
      _thumbnail = compressedFile;
    });

    return compressedFile;
  }

  _imageItem() {
    if (_image != null) {
      return Image.file(_image!);
    } else {
      return Container();
    }
  }

  _thumbnailItem() {
    if (_thumbnail != null) {
      return Image.file(_thumbnail!);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _imageItem(),
            const SizedBox(height: 50),
            _thumbnailItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _chooseImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
