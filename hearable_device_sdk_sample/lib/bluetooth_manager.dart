import 'package:flutter/foundation.dart';

import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

class DeviceInfo {
  final String deviceId;
  final String name;
  final int rssi;

  const DeviceInfo({
    required this.deviceId,
    required this.name,
    required this.rssi
  });

  factory DeviceInfo.fromMap(Map<String,dynamic> info) {
    return DeviceInfo(
      deviceId: info['deviceId'] as String,
      name: info['name'] as String,
      rssi: info['rssi']
    );
  }
}

class BluetoothManager extends ChangeNotifier {
  final HearableDeviceSdkSamplePlugin _samplePlugin = HearableDeviceSdkSamplePlugin();

  bool _isConnected = false;
  String _deviceName = "";
  int _resultCode = 0;
  final List<DeviceInfo> _deviceList = [];


  Function(int)? _connectCallback;
  Function(int)? _disconnectCallback;
  Function(int)? _scanCallback;

  static final BluetoothManager _instance = BluetoothManager._internal();

  factory BluetoothManager() {
    return _instance;
  }

  BluetoothManager._internal();

  bool get isConnected => _isConnected;
  String get deviceName => _deviceName;
  int get resultCode => _resultCode;
  List<DeviceInfo> get deviceList => _deviceList;

  Future<bool> registHearableStatusListener() async {
    final res = await _samplePlugin.registHearableStatusListener(onChangeStatus: _onChangeStatus);
    return res;
  }

  Future<bool> addHearableBleListener({required Function(int)? connectCallback, required Function(int)? disconnectCallback, required Function(int)? scanCallback}) async {
    _connectCallback = connectCallback;
    _disconnectCallback = disconnectCallback;
    _scanCallback = scanCallback;

    print("addHearableBleListener");
    final res = await _samplePlugin.addHearableBleListener(onConnect: _onConnect, onDisconnect: _onDisconnect, onScanResult: _onScanResult);
    return res;
  }

  Future<bool> unregistHearableStatusListener() async {
    final res = await _samplePlugin.unregistHearableStatusListener();
    return res;
  }

  Future<bool> removeHearableBleListener() async {
    final res = await _samplePlugin.removeHearableBleListener();
    return res;
  }

  void reset() {
    _isConnected = false;
    _deviceName = "";
    _connectCallback = null;
    _disconnectCallback = null;
    _scanCallback = null;
  }

  void _onConnect(int resultCode) {
    _resultCode = resultCode;
    if (_connectCallback != null) {
      _connectCallback!(resultCode);
    }
    notifyListeners();
  }

  void _onDisconnect(int resultCode) {
    _resultCode = resultCode;
    if (_disconnectCallback != null) {
      _disconnectCallback!(resultCode);
    }
    notifyListeners();
  }

  void _onScanResult(List<Map<String, dynamic>>? deviceList, int resultCode) {
    _deviceList.clear();
    if (resultCode == 0 && deviceList != null) {
      for (Map<String, dynamic> info in deviceList) {
        _deviceList.add(DeviceInfo.fromMap(info));
      }
    }

    _resultCode = resultCode;
    if (_scanCallback != null) {
      _scanCallback!(resultCode);
    }
    notifyListeners();
  }

  void _onChangeStatus(Map<String, dynamic> hearableStatus) {
    _isConnected =  hearableStatus['isConnected'] as bool;
    _deviceName = hearableStatus['deviceName'] as String;
    notifyListeners();
  }
}