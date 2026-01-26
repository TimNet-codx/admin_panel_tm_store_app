// // import 'package:flutter/material.dart';

// // class ImagePickerRow extends StatelessWidget {
// //   final File? image;
// //   final VoidCallback onPick;

// //   const ImagePickerRow({
// //     super.key,
// //     required this.image,
// //     required this.onPick,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Container(
// //           width: 200,
// //           height: 200,
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200,
// //             borderRadius: BorderRadius.circular(8),
// //             image: image != null
// //                 ? DecorationImage(
// //                     image: FileImage(image!),
// //                     fit: BoxFit.cover,
// //                   )
// //                 : null,
// //           ),
// //           child: image == null
// //               ? const Icon(Icons.image, size: 32)
// //               : null,
// //         ),
// //         const SizedBox(width: 10),
// //         ElevatedButton.icon(
// //           onPressed: onPick,
// //           icon: const Icon(Icons.upload_file),
// //           label: const Text('Upload Image'),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';

// class ImagePickerRow extends StatelessWidget {
//  final File? file;
//   final Uint8List? bytes;
//   final VoidCallback onPick;

//   const ImagePickerRow({
//     super.key,
//     this.file,
//     this.bytes,
//     required this.onPick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget imageWidget;

//     if (bytes != null) {
//       imageWidget = Image.memory(bytes!, fit: BoxFit.cover);
//     } else if (file != null) {
//       imageWidget = Image.file(file!, fit: BoxFit.cover);
//     } else {
//       imageWidget = const Icon(Icons.image, size: 32);
//     }

//     return Row(
//       children: [
//         Container(
//           width: 90,
//           height: 90,
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//             image: image != null
//                 ? DecorationImage(
//                     image: FileImage(image!),
//                     fit: BoxFit.cover,
//                   )
//                 : null,
//           ),
//           child: image == null
//               ? const Icon(Icons.image, size: 32)
//               : null,
//         ),
//         const SizedBox(width: 10),

//         SizedBox(
//           height: 40,
//           width: 140,
//           child: ElevatedButton.icon(
//             onPressed: onPick,
//             icon: const Icon(Icons.upload_file),
//             label: const Text('Upload Image'),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImagePickerRow extends StatelessWidget {
  final File? file;
  final Uint8List? bytes;
  final VoidCallback onPick;
  final String buttonText;

  const ImagePickerRow({
    super.key,
    this.file,
    this.bytes,
    required this.onPick,
     this.buttonText = 'Upload Image',
    
    

  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (bytes != null) {
      imageWidget = Image.memory(bytes!, fit: BoxFit.cover);
    } else if (file != null) {
      imageWidget = Image.file(file!, fit: BoxFit.cover);
    } else {
      imageWidget = const Icon(Icons.image, size: 32);
    }

    return Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: imageWidget,
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: onPick,
          icon: const Icon(Icons.upload_file),
          label: Text(buttonText),
        ),
      ],
    );
  }
}

