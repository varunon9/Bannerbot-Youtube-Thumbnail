import 'dart:io';

import 'package:bannerbot_youtube_thumbnail/src/network.dart';

Future<Map<String, dynamic>> getThumbnailsData(String prompt) {
  String endpoint = '';

  return Network.postRequest(
      endpoint,
      {'Platform': Platform.isAndroid ? 'android' : 'ios'},
      {'deviceId': '', 'query': prompt});
}
