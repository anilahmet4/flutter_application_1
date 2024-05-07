import 'package:flutter/material.dart';

class UserInputPopUp extends StatefulWidget {
  const UserInputPopUp({super.key});

  @override
  State<UserInputPopUp> createState() => _UserInputPopUpState();
}

class _UserInputPopUpState extends State<UserInputPopUp> {
  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Key to manage the form

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Aylık Gelir'),
      content: Form(
        key: _formKey, // Attach the form key
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use min size for the content
          children: [
            const Text('Lütfen aylık toplam gelirinizi girin:'),
            TextFormField(
              controller: textEditingController, // Attach the controller
              keyboardType: TextInputType.number, // Keyboard type optimized for numeric input
              decoration: const InputDecoration(
                hintText: 'Gelir',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir değer girin';
                }
                // Regular expression to check if the string contains only numbers
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Lütfen sadece sayı girin';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('İptal'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without saving
          },
        ),
        TextButton(
          child: const Text('Kaydet'),
          onPressed: () {                         //user input HIV loguna eklenmeli.
            if (_formKey.currentState?.validate() ?? false) {
              print('Text entered: ${textEditingController.text}');
              Navigator.of(context).pop(); 
            }
          },
        ),
      ],
    );
  }
}
