
import 'dart:io';
import 'package:admin_panel_tm_store_app/PickedImage/pickedImage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// Future<void> pickImage() async {
//   final picker = ImagePicker();
//   final XFile? picked =
//       await picker.pickImage(source: ImageSource.gallery);

//   if (picked != null) {
//     imageNotifier.value = File(picked.path);
//   }
// }


// Future<void> pickImage() async {
//   final FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.image,
//     allowMultiple: false,
//     withData: true,
//   );

//   // if (result != null && result.files.single.path != null) {
//   //   imageNotifier.value = File(result.files.single.path!);
//   // }
//     if (result != null) {
//     final file = result.files.single;

//     imageNotifier.value = File(
//       file: kIsWeb ? null : File(file.path!),
//       bytes: file.bytes,
//     );
//   }
// }


final ValueNotifier<PickedImage?> imageNotifier = ValueNotifier<PickedImage?>(null);
final ValueNotifier<PickedImage?> imageBannerNotifier = ValueNotifier<PickedImage?>(null);


// Future<void> pickedImage() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.image,
//     allowMultiple: false,
//     withData: true, // IMPORTANT
//   );

//   if (result != null) {
//     final file = result.files.single;

//     imageNotifier.value = PickedImage(
//       file: kIsWeb ? null : File(file.path!),
//       bytes: file.bytes,
//     );
//   }
// }
Future<void> pickedImage() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
    withData: true, // IMPORTANT
  );

  if (result != null && result.files.single.bytes != null) {
    final file = result.files.single;

    imageNotifier.value = PickedImage(
      file: kIsWeb ? null : File(file.path!),
      bytes: file.bytes!, // ensure non-null
    );
  }
}

Future<void> pickedBanner() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
    withData: true, // IMPORTANT
  );

  if (result != null && result.files.single.bytes != null) {
    final file = result.files.single;

    imageBannerNotifier.value = PickedImage(
      file: kIsWeb ? null : File(file.path!),
      bytes: file.bytes!, // ensure non-null
    );
  }
}


// Future<void> pickedBanner() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.image,
//     allowMultiple: false,
//     withData: true, // IMPORTANT
//   );

//   if (result != null) {
//     final file = result.files.single;

//     imageBannerNotifier.value = PickedImage(
//       file: kIsWeb ? null : File(file.path!),
//       bytes: file.bytes,
//     );
//   }
// }





