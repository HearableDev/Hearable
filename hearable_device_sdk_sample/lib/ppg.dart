import 'package:flutter/foundation.dart';

import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

class Ppg extends ChangeNotifier {
  final HearableDeviceSdkSamplePlugin _samplePlugin = HearableDeviceSdkSamplePlugin();
  bool isEnabled = false;

  int? _resultCode;
  Uint8List? _data;

  static final Ppg _instance = Ppg._internal();

  factory Ppg() {
    return _instance;
  }

  Ppg._internal();

  int? get resultCode => _resultCode;
  Uint8List? get data => _data;

  String getResultString() {
    String str = '';

    if (_resultCode != null) {
      str += 'result code: $_resultCode';
    }

    if (_data != null) {
      str += '\nbyte[]:\n';
      Uint8List data = _data!;
      for (int i = 0; i < data.length - 1; i++) {
        str += '${data[i].toRadixString(16)}, ';
      }
      str += data.last.toRadixString(16);
    }
    return str;
  }

  Future<bool> addPpgNotificationListener() async {
    final res = await _samplePlugin.addPpgNotificationListener(onStartNotification: _onStartNotification, onStopNotification: _onStopNotification, onReceiveNotification: _onReceiveNotification);
    return res;
  }

  void _removePpgNotificationListener() {
    _samplePlugin.removePpgNotificationListener();
  }

  void _onStartNotification(int resultCode) {
    _resultCode = resultCode;
    notifyListeners();
  }

  void _onStopNotification(int resultCode) {
    _removePpgNotificationListener();
    _resultCode = resultCode;
    notifyListeners();
  }

  void _onReceiveNotification(Uint8List? data, int resultCode) {
    _data = data;
    _resultCode = resultCode;
    notifyListeners();
  }
}