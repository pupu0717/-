import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'database.dart';

//写真を保存する関数
Future<String?> pickAndSaveImage() async {
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final appDocPath = await getApplicationDocumentsDirectoryPath();
      final fileName = pickedFile.name;
      final savedImagePath = '$appDocPath/$fileName';
      await File(pickedFile.path).copy(savedImagePath);
      return savedImagePath;
    }
  } catch (e) {
    print('Error picking image: $e');
  }
  return null;
}
