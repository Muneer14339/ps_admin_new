import 'dart:io';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({required bool isGallery}) async {
  File? convertedFile;
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
      source: isGallery ? ImageSource.gallery : ImageSource.camera);
  if (image != null) {
    convertedFile = File(image.path);
    return convertedFile;
  }
  return convertedFile;
}

//

int getRandomValue() {
  math.Random random = math.Random();
  return random.nextInt(10) + 1;
}
