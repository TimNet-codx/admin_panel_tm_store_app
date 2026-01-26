import 'dart:io';
import 'dart:typed_data';

class PickedImage {
  final File? file;
  final Uint8List? bytes;

  PickedImage({this.file, this.bytes});
}
