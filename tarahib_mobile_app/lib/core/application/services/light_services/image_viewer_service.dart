import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';

class ImageViewerService {
  static showImage(String url) => navigationService.navigateToView(PhotoView(
        imageProvider: NetworkImage(url),
      ));
}
