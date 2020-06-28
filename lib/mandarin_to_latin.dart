import 'dart:async';

import 'package:flutter/services.dart';

class MandarinToLatin {
  static const String channelName = 'mandarin_to_latin';

  static const MethodChannel _channel = const MethodChannel(channelName);

  static Future<String> mandarinToLatin(String chineseText) async {
    final String latinText = await _channel.invokeMethod('mandarinToLatin', chineseText);
    return latinText;
  }
}
