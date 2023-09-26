import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hearable_device_sdk_sample_plugin_method_channel.dart';

abstract class HearableDeviceSdkSamplePluginPlatform extends PlatformInterface {
  /// Constructs a HearableDeviceSdkSamplePluginPlatform.
  HearableDeviceSdkSamplePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static HearableDeviceSdkSamplePluginPlatform _instance = MethodChannelHearableDeviceSdkSamplePlugin();

  /// The default instance of [HearableDeviceSdkSamplePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelHearableDeviceSdkSamplePlugin].
  static HearableDeviceSdkSamplePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HearableDeviceSdkSamplePluginPlatform] when
  /// they register themselves.
  static set instance(HearableDeviceSdkSamplePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
