import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageUtils {
  static final _picker = ImagePicker();

  static Future<String?> pickFromGallery({
    int quality = 80,
    int maxWidth = 800,
    int maxHeight = 800,
  }) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return null;
    return _convertToJpeg(picked.path, quality: quality, maxWidth: maxWidth, maxHeight: maxHeight);
  }

  static Future<String?> _convertToJpeg(
    String sourcePath, {
    int quality = 80,
    int maxWidth = 800,
    int maxHeight = 800,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = 'img_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final targetPath = '${dir.path}/$fileName';

    final result = await FlutterImageCompress.compressAndGetFile(
      sourcePath,
      targetPath,
      format: CompressFormat.jpeg,
      quality: quality,
      minWidth: maxWidth,
      minHeight: maxHeight,
    );

    return result?.path;
  }

  static Future<void> deleteIfExists(String? path) async {
    if (path == null) return;
    final file = File(path);
    if (await file.exists()) await file.delete();
  }
}
