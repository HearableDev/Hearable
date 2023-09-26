import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hearable_device_sdk_sample_plugin_platform_interface.dart';

/// An implementation of [HearableDeviceSdkSamplePluginPlatform] that uses method channels.
class MethodChannelHearableDeviceSdkSamplePlugin extends HearableDeviceSdkSamplePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hearable_device_sdk_sample_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
