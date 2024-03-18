import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/utilities/data_set_container.dart';
import 'package:flutter_application_1/utilities/dialog_box.dart';

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

  showPopupButton(BuildContext context) async {
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
                  _pickImageFromCamera();
                // Handle Camera action
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
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
  
  void saveNewTask(){
    setState(() {
      denemeList.add([_controller1.text, _controller2.text]);
      _controller1.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewRow(){
    showDialog(
      context: context, 
      builder: (context){
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
        onPressed: createNewRow,//showPopupButton(context),
        
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
        //),
    ); 
  }

  // ignore: unused_field
  File ? _selectedImage;
  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if(returnedImage == null) return;

    setState(() {  
      _selectedImage = File(returnedImage.path);
    });
  }
}