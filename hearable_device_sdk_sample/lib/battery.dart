import 'package:flutter/foundation.dart';

import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

class Battery extends ChangeNotifier {
  final HearableDeviceSdkSamplePlugin _samplePlugin = HearableDeviceSdkSamplePlugin();
  bool isEnabled = false;

  int? _resultCode;
  Uint8List? _data;

  static final Battery _instance = Battery._internal();

  factory Battery() {
    return _instance;
  }

  Battery._internal();

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

      Uint8List percent = Uint8List.fromList(data.sublist(0,2));
      var percentBytes = percent.buffer.asByteData();
      str += '${percentBytes.getInt16(0, Endian.little)} %  ';

      Uint8List value = Uint8List.fromList(data.sublist(2,4));
      var valueBytes = value.buffer.asByteData();
      str += '${valueBytes.getInt16(0, Endian.little)} mV';
    }

    return str;
  }

  Future<bool> addBatteryNotificationListener() async {
    final res = await  _samplePlugin.addBatteryNotificationListener(onStartNotification: _onStartNotification, onStopNotification: _onStopNotification, onReceiveNotification: _onReceiveNotification);
    return res;
  }

  void _removeBatteryNotificationListener() {
    _samplePlugin.removeBatteryNotificationListener();
  }

  void _onStartNotification(int resultCode) {
    _resultCode = resultCode;
    notifyListeners();
  }

  void _onStopNotification(int resultCode) {
    _removeBatteryNotificationListener();
    _resultCode = resultCode;
    notifyListeners();
  }

  void _onReceiveNotification(Uint8List? data, int resultCode) {
    _data = data;
    _resultCode = resultCode;
    notifyListeners();
  }
}