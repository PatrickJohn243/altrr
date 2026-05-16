import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  /// Captures the widget tree under [key] as a transparent-background PNG
  /// and opens the OS share sheet.
  static Future<void> shareQuestCard(
    GlobalKey key, {
    String filename = 'altrr_quest.png',
  }) async {
    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return;

    // pixelRatio 3 → crisp on all screen densities
    final image = await boundary.toImage(pixelRatio: 3.0);
    final bytes =
        await image.toByteData(format: ui.ImageByteFormat.png);
    if (bytes == null) return;

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename')
      ..writeAsBytesSync(bytes.buffer.asUint8List());

    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'image/png')],
      subject: 'Quest complete — altrr',
    );
  }
}
