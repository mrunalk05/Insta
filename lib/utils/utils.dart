import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

PickImage(ImageSource source) async {
  final ImagePicker _image_picker = ImagePicker();

  XFile? _file = await _image_picker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}

ShowSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
