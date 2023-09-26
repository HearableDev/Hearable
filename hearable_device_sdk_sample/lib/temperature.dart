import 'package:flutter/foundation.dart';

import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

class Temperature extends ChangeNotifier {
  final HearableDeviceSdkSamplePlugin _samplePlugin = HearableDeviceSdkSamplePlugin();
  bool isEnabled = false;

  int? _resultCode;
  Uint8List? _data;

  static final Temperature _instance = Temperature._internal();

  factory Temperature() {
    return _instance;
  }

  Temperature._internal();

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
      str += '${data.last.toRadixString(16)}\n';

      Uint8List tempByte = Uint8List.fromList(data.sublist(0,2));
      var bytes = tempByte.buffer.asByteData();
      str += '${bytes.getInt16(0, Endian.little) / 10.0} ℃';
    }
    return str;
  }

  Future<bool> addTemperatureNotificationListener() async {
    final res = await _samplePlugin.addTemperatureNotificationListener(onStartNotification: _onStartNotification, onStopNotification: _onStopNotification, onReceiveNotification: _onReceiveNotification);
    return res;
  }

  void _removeTemperatureNotificationListener() {
    _samplePlugin.removeTemperatureNotificationListener();
  }

  void _onStartNotification(int resultCode) {
    _resultCode = resultCode;
    notifyListeners();
  }

  void _onStopNotification(int resultCode) {
    _removeTemperatureNotificationListener();
    _resultCode = resultCode;
    notifyListeners();
  }

  void _onReceiveNotification(Uint8List? data, int resultCode) {
    _data = data;
    _resultCode = resultCode;
    notifyListeners();
  }
}