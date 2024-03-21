import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/text_analysis_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/utilities/data_set_container.dart';
import 'package:flutter_application_1/utilities/dialog_box.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  //text controller
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  //price list
  List<dynamic> denemeList = [
    ["01/02/2024", "120"],
    ["06/02/2024", "350"],
    ["08/02/2024", "245"],
    ["11/02/2024", "90"],
  ];

  File? _selectedImage;

  void showPopupButton() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromCamera();
                  // Handle Camera action
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromGallery();
                  // Handle Gallery action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      denemeList.add([_controller1.text, _controller2.text]);
      _controller1.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewRow() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller1: _controller1,
          controller2: _controller2,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //asıl body vs
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showPopupButton,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body:
          //SingleChildScrollView(
          Column(
        children: [
          const DataSetConainer(
            dayText: "Fiş Tarihi",
            priceText: "Tutar",
          ),
          ListView.builder(
            itemCount: denemeList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DataSetConainer(
                dayText: denemeList.reversed.toList()[index][0],
                priceText: denemeList.reversed.toList()[index][1],
              );
            },
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    _processImage(File(returnedImage.path));
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    _processImage(File(returnedImage.path));
  }

  Future<void> _processImage(File image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    // Use the recognized text to find the total price and dates
    final String totalPrice = findTotalPrice(recognizedText.text);
    final List<String> dates = findDates(recognizedText.text);

    // Optionally, choose the first date found (or handle multiple dates as needed)
    final String date = dates.isNotEmpty ? dates.first : 'Date not found';

    // Add the date and total price to denemeList
    setState(() {
      denemeList.add([standardizeDate(date), totalPrice]);
      _selectedImage = image;
      _controller1.text =
          recognizedText.text; // Optionally store the recognized text
    });

    // Debug print
    debugPrint('Date: $date, Total Price: $totalPrice');

    // Dispose of the recognizer when it's no longer needed
    textRecognizer.close();
  }
}
