import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

class ImageHandler {
  static const int _maxWidth = 1280;
  static const int _maxHeight = 1280;

  static List<int> restrictImageSize(Uint8List image) {
    // Decode the image to an `Image` object
    img.Image originalImage = img.decodeImage(image)!;

    // Determine the target width and height for the image
    int targetWidth, targetHeight;
    if (originalImage.width > _maxWidth || originalImage.height > _maxHeight) {
      // If either dimension of the original image is larger than the maximum allowed size,
      // calculate the scaling factor to fit the image within the maximum dimensions
      double scaleFactor = min(
          _maxWidth / originalImage.width, _maxHeight / originalImage.height);
      targetWidth = (originalImage.width * scaleFactor).round();
      targetHeight = (originalImage.height * scaleFactor).round();
    } else {
      // If both dimensions of the original image are already within the maximum allowed size,
      // use the original dimensions as the target dimensions
      targetWidth = originalImage.width;
      targetHeight = originalImage.height;
    }

    // Use the `resize` function to resize the image to the target width and height
    img.Image resizedImage =
        img.copyResize(originalImage, width: targetWidth, height: targetHeight);

    // Encode the image back to a `Uint8List`
    return img.encodePng(resizedImage);
  }
}
