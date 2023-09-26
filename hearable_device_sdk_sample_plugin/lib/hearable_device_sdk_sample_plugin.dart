import 'package:flutter/services.dart';


class HearableDeviceSdkSamplePlugin {
  static const MethodChannel _channel =
      MethodChannel('hearable_device_sdk_sample_plugin');

  // HearableStatus
  Function(Map<String, dynamic>)? _onChangeStatus;
  // BleResult
  Function(int)? _onConnect;
  Function(int)? _onDisconnect;
  Function(List<Map<String, dynamic>>?, int)? _onScanResult;
  // Battery
  Function(int)? _onStartBatteryNotification;
  Function(int)? _onStopBatteryNotification;
  Function(Uint8List?, int)? _onReceiveBatteryNotification;
  // NineAxisSensor
  Function(int)? _onStartNineAxisSensorNotification;
  Function(int)? _onStopNineAxisSensorNotification;
  Function(Uint8List?, int)? _onReceiveNineAxisSensorNotification;
  // Temperature
  Function(int)? _onStartTemperatureNotification;
  Function(int)? _onStopTemperatureNotification;
  Function(Uint8List?, int)? _onReceiveTemperatureNotification;
  // HeartRate
  Function(int)? _onStartHeartRateNotification;
  Function(int)? _onStopHeartRateNotification;
  Function(Uint8List?, int)? _onReceiveHeartRateNotification;
  // Ppg
  Function(int)? _onStartPpgNotification;
  Function(int)? _onStopPpgNotification;
  Function(Uint8List?, int)? _onReceivePpgNotification;
  // Eaa
  Function(int)? _onRegister;
  Function(int)? _onCancelRegistration;
  Function(int)? _onDeleteRegistration;
  Function(double?, String?, int)? _onVerify;
  Function(List<String>?, int)? _onGetRegistrationStatus;
  // exception
  //Function(String)? _onCatchException;

  static final HearableDeviceSdkSamplePlugin _instance =
      HearableDeviceSdkSamplePlugin._internal();

  factory HearableDeviceSdkSamplePlugin() {
    return _instance;
  }

  HearableDeviceSdkSamplePlugin._internal() {
    _channel.setMethodCallHandler(_platformCallHandler);
  }

  // platform(java,swift)からの呼び出し
  Future _platformCallHandler(MethodCall call) async {
    print(call.method);
    switch (call.method) {
      case 'onChangeStatus':
        _callChangeStatusCallback(call);
        break;
      case 'onConnect':
        _callConnectCallback(call);
        break;
      case 'onDisconnect':
        _callDisconnectCallback(call);
        break;
      case 'onScanResult':
        _callScanResultCallback(call);
        break;
      case 'onStartBatteryNotification':
        _callStartBatteryNotificationCallback(call);
        break;
      case 'onStopBatteryNotification':
        _callStopBatteryNotificationCallback(call);
        break;
      case 'onReceiveBatteryNotification':
        _callReceiveBatteryNotificationCallback(call);
        break;
      case 'onStartNineAxisSensorNotification':
        _callStartNineAxisSensorNotificationCallback(call);
        break;
      case 'onStopNineAxisSensorNotification':
        _callStopNineAxisSensorNotificationCallback(call);
        break;
      case 'onReceiveNineAxisSensorNotification':
        _callReceiveNineAxisSensorNotificationCallback(call);
        break;
      case 'onStartTemperatureNotification':
        _callStartTemperatureNotificationCallback(call);
        break;
      case 'onStopTemperatureNotification':
        _callStopTemperatureNotificationCallback(call);
        break;
      case 'onReceiveTemperatureNotification':
        _callReceiveTemperatureNotificationCallback(call);
        break;
      case 'onStartHeartRateNotification':
        _callStartHeartRateNotificationCallback(call);
        break;
      case 'onStopHeartRateNotification':
        _callStopHeartRateNotificationCallback(call);
        break;
      case 'onReceiveHeartRateNotification':
        _callReceiveHeartRateNotificationCallback(call);
        break;
      case 'onStartPpgNotification':
        _callStartPpgNotificationCallback(call);
        break;
      case 'onStopPpgNotification':
        _callStopPpgNotificationCallback(call);
        break;
      case 'onReceivePpgNotification':
        _callReceivePpgNotificationCallback(call);
        break;
      case 'onRegister':
        _callRegisterCallback(call);
        break;
      case 'onCancelRegistration':
        _callCancelRegistrationCallback(call);
        break;
      case 'onDeleteRegistration':
        _callDeleteRegistrationCallback(call);
        break;
      case 'onVerify':
        _callVerifyCallback(call);
        break;
      case 'onGetRegistrationStatus':
        _callGetRegistrationStatusCallback(call);
        break;
      default:
        break;
    }
  }

  Future _callChangeStatusCallback(MethodCall call) async {
    if (_onChangeStatus != null) {
      var status = Map<String, dynamic>.from(call.arguments);
      _onChangeStatus!(status);
    }
  }

  Future _callConnectCallback(MethodCall call) async {
    if (_onConnect != null) {
      int resultCode = call.arguments as int;
      _onConnect!(resultCode);
    }
  }

  Future _callDisconnectCallback(MethodCall call) async {
    if (_onDisconnect != null) {
      int resultCode = call.arguments as int;
      _onDisconnect!(resultCode);
    }
  }

  Future _callScanResultCallback(MethodCall call) async {
    if (_onScanResult != null) {
      var deviceList = call.arguments['deviceList'];
      int resultCode = call.arguments['resultCode'];

      List<Map<String, dynamic>> deviceList0 = [];
      if (deviceList != null) {
        for (var device in deviceList) {
          deviceList0.add(Map<String, dynamic>.from(device));
        }
        _onScanResult!(deviceList0, resultCode);
      } else {
        _onScanResult!(deviceList, resultCode);
      }
    }
  }

  Future _callStartBatteryNotificationCallback(MethodCall call) async {
    if (_onStartBatteryNotification != null) {
      int resultCode = call.arguments as int;
      _onStartBatteryNotification!(resultCode);
    }
  }

  Future _callStopBatteryNotificationCallback(MethodCall call) async {
    if (_onStopBatteryNotification != null) {
      int resultCode = call.arguments as int;
      _onStopBatteryNotification!(resultCode);
    }
  }

  Future _callReceiveBatteryNotificationCallback(MethodCall call) async {
    if (_onReceiveBatteryNotification != null) {
      Uint8List? data = call.arguments['data'] as Uint8List?;
      int resultCode = call.arguments['resultCode'];
      _onReceiveBatteryNotification!(data, resultCode);
    }
  }

  Future _callStartNineAxisSensorNotificationCallback(MethodCall call) async {
    if (_onStartNineAxisSensorNotification != null) {
      int resultCode = call.arguments as int;
      _onStartNineAxisSensorNotification!(resultCode);
    }
  }

  Future _callStopNineAxisSensorNotificationCallback(MethodCall call) async {
    if (_onStopNineAxisSensorNotification != null) {
      int resultCode = call.arguments as int;
      _onStopNineAxisSensorNotification!(resultCode);
    }
  }

  Future _callReceiveNineAxisSensorNotificationCallback(MethodCall call) async {
    if (_onReceiveNineAxisSensorNotification != null) {
      Uint8List? data = call.arguments['data'] as Uint8List?;
      int resultCode = call.arguments['resultCode'];
      _onReceiveNineAxisSensorNotification!(data, resultCode);
    }
  }

  Future _callStartTemperatureNotificationCallback(MethodCall call) async {
    if (_onStartTemperatureNotification != null) {
      int resultCode = call.arguments as int;
      _onStartTemperatureNotification!(resultCode);
    }
  }

  Future _callStopTemperatureNotificationCallback(MethodCall call) async {
    if (_onStopTemperatureNotification != null) {
      int resultCode = call.arguments as int;
      _onStopTemperatureNotification!(resultCode);
    }
  }

  Future _callReceiveTemperatureNotificationCallback(MethodCall call) async {
    if (_onReceiveTemperatureNotification != null) {
      Uint8List? data = call.arguments['data'] as Uint8List?;
      int resultCode = call.arguments['resultCode'];
      _onReceiveTemperatureNotification!(data, resultCode);
    }
  }

  Future _callStartHeartRateNotificationCallback(MethodCall call) async {
    if (_onStartHeartRateNotification != null) {
      int resultCode = call.arguments as int;
      _onStartHeartRateNotification!(resultCode);
    }
  }

  Future _callStopHeartRateNotificationCallback(MethodCall call) async {
    if (_onStopHeartRateNotification != null) {
      int resultCode = call.arguments as int;
      _onStopHeartRateNotification!(resultCode);
    }
  }

  Future _callReceiveHeartRateNotificationCallback(MethodCall call) async {
    if (_onReceiveHeartRateNotification != null) {
      Uint8List? data = call.arguments['data'] as Uint8List?;
      int resultCode = call.arguments['resultCode'];
      _onReceiveHeartRateNotification!(data, resultCode);
    }
  }

  Future _callStartPpgNotificationCallback(MethodCall call) async {
    if (_onStartPpgNotification != null) {
      int resultCode = call.arguments as int;
      _onStartPpgNotification!(resultCode);
    }
  }

  Future _callStopPpgNotificationCallback(MethodCall call) async {
    if (_onStopPpgNotification != null) {
      int resultCode = call.arguments as int;
      _onStopPpgNotification!(resultCode);
    }
  }

  Future _callReceivePpgNotificationCallback(MethodCall call) async {
    if (_onReceivePpgNotification != null) {
      Uint8List? data = call.arguments['data'] as Uint8List?;
      int resultCode = call.arguments['resultCode'];
      _onReceivePpgNotification!(data, resultCode);
    }
  }

  Future _callRegisterCallback(MethodCall call) async {
    if (_onRegister != null) {
      int resultCode = call.arguments as int;
      _onRegister!(resultCode);
    }
  }

  Future _callCancelRegistrationCallback(MethodCall call) async {
    if (_onCancelRegistration != null) {
      int resultCode = call.arguments as int;
      _onCancelRegistration!(resultCode);
    }
  }

  Future _callDeleteRegistrationCallback(MethodCall call) async {
    if (_onDeleteRegistration != null) {
      int resultCode = call.arguments as int;
      _onDeleteRegistration!(resultCode);
    }
  }

  Future _callVerifyCallback(MethodCall call) async {
    if (_onVerify != null) {
      double? score = call.arguments['score'] as double?;
      String? uuid = call.arguments['uuid'] as String?;
      int resultCode = call.arguments['resultCode'] as int;
      _onVerify!(score, uuid, resultCode);
    }
  }

  Future _callGetRegistrationStatusCallback(MethodCall call) async {
    if (_onGetRegistrationStatus != null) {
      var uuids = call.arguments['uuids'];
      int resultCode = call.arguments['resultCode'] as int;

      List<String> uuids0 = [];
      if (uuids != null) {
        for (var uuid in uuids) {
          uuids0.add(uuid as String);
        }
        _onGetRegistrationStatus!(uuids0, resultCode);
      } else {
        _onGetRegistrationStatus!(uuids, resultCode);
      }
    }
  }

  Future<void> startService() async {
    await _channel.invokeMethod('startService');
    return;
  }

  Future<void> stopService() async {
    await _channel.invokeMethod('stopService');
    return;
  }

  Future<bool> scanHearableDevices() async {
    final res = await _channel.invokeMethod('scanHearableDevices');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> connectBleToSpecifiedDevice({required String deviceId}) async {
    final res = await _channel.invokeMethod(
        'connectBleToSpecifiedDevice', <String, dynamic>{'deviceId': deviceId});

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> connectBleToClassic() async {
    final res = await _channel.invokeMethod('connectBleToClassic');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> disconnectBle() async {
    final res = await _channel.invokeMethod('disconnectBle');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> registHearableStatusListener(
      {required Function(Map<String, dynamic>) onChangeStatus}) async {
    _onChangeStatus = onChangeStatus;

    final res = await _channel.invokeMethod('registHearableStatusListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addHearableBleListener(
      {required Function(int) onConnect,
      required Function(int) onDisconnect,
      required Function(List<Map<String, dynamic>>?, int) onScanResult}) async {
    _onConnect = onConnect;
    _onDisconnect = onDisconnect;
    _onScanResult = onScanResult;

    final res = await _channel.invokeMethod('addHearableBleListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> unregistHearableStatusListener() async {
    _onChangeStatus = null;

    final res = await _channel.invokeMethod('unregistHearableStatusListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removeHearableBleListener() async {
    _onConnect = null;
    _onDisconnect = null;
    _onScanResult = null;

    final res = await _channel.invokeMethod('removeHearableBleListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> startBatteryNotification() async {
    final res = await _channel.invokeMethod('startBatteryNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> stopBatteryNotification() async {
    final res = await _channel.invokeMethod('stopBatteryNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addBatteryNotificationListener(
      {required Function(int) onStartNotification,
      required Function(int) onStopNotification,
      required Function(Uint8List?, int) onReceiveNotification}) async {
    _onStartBatteryNotification = onStartNotification;
    _onStopBatteryNotification = onStopNotification;
    _onReceiveBatteryNotification = onReceiveNotification;

    final res = await _channel.invokeMethod('addBatteryNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removeBatteryNotificationListener() async {
    _onStartBatteryNotification = null;
    _onStopBatteryNotification = null;
    _onReceiveBatteryNotification = null;

    final res =
        await _channel.invokeMethod('removeBatteryNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> startNineAxisSensorNotification() async {
    final res = await _channel.invokeMethod('startNineAxisSensorNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> stopNineAxisSensorNotification() async {
    final res = await _channel.invokeMethod('stopNineAxisSensorNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addNineAxisSensorNotificationListener(
      {required Function(int) onStartNotification,
      required Function(int) onStopNotification,
      required Function(Uint8List?, int) onReceiveNotification}) async {
    _onStartNineAxisSensorNotification = onStartNotification;
    _onStopNineAxisSensorNotification = onStopNotification;
    _onReceiveNineAxisSensorNotification = onReceiveNotification;

    final res =
        await _channel.invokeMethod('addNineAxisSensorNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removeNineAxisSensorNotificationListener() async {
    _onStartNineAxisSensorNotification = null;
    _onStopNineAxisSensorNotification = null;
    _onReceiveNineAxisSensorNotification = null;

    final res =
        await _channel.invokeMethod('removeNineAxisSensorNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> startTemperatureNotification() async {
    final res = await _channel.invokeMethod('startTemperatureNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> stopTemperatureNotification() async {
    final res = await _channel.invokeMethod('stopTemperatureNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addTemperatureNotificationListener(
      {required Function(int) onStartNotification,
      required Function(int) onStopNotification,
      required Function(Uint8List?, int) onReceiveNotification}) async {
    _onStartTemperatureNotification = onStartNotification;
    _onStopTemperatureNotification = onStopNotification;
    _onReceiveTemperatureNotification = onReceiveNotification;

    final res =
        await _channel.invokeMethod('addTemperatureNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removeTemperatureNotificationListener() async {
    _onStartTemperatureNotification = null;
    _onStopTemperatureNotification = null;
    _onReceiveTemperatureNotification = null;

    final res =
        await _channel.invokeMethod('removeTemperatureNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> startHeartRateNotification() async {
    final res = await _channel.invokeMethod('startHeartRateNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> stopHeartRateNotification() async {
    final res = await _channel.invokeMethod('stopHeartRateNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addHeartRateNotificationListener(
      {required Function(int) onStartNotification,
      required Function(int) onStopNotification,
      required Function(Uint8List?, int) onReceiveNotification}) async {
    _onStartHeartRateNotification = onStartNotification;
    _onStopHeartRateNotification = onStopNotification;
    _onReceiveHeartRateNotification = onReceiveNotification;

    final res = await _channel.invokeMethod('addHeartRateNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removeHeartRateNotificationListener() async {
    _onStartHeartRateNotification = null;
    _onStopHeartRateNotification = null;
    _onReceiveHeartRateNotification = null;

    final res =
        await _channel.invokeMethod('removeHeartRateNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> startPpgNotification() async {
    final res = await _channel.invokeMethod('startPpgNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> stopPpgNotification() async {
    final res = await _channel.invokeMethod('stopPpgNotification');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addPpgNotificationListener(
      {required Function(int) onStartNotification,
      required Function(int) onStopNotification,
      required Function(Uint8List?, int) onReceiveNotification}) async {
    _onStartPpgNotification = onStartNotification;
    _onStopPpgNotification = onStopNotification;
    _onReceivePpgNotification = onReceiveNotification;

    final res = await _channel.invokeMethod('addPpgNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removePpgNotificationListener() async {
    _onStartPpgNotification = null;
    _onStopPpgNotification = null;
    _onReceivePpgNotification = null;

    final res = await _channel.invokeMethod('removePpgNotificationListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> registerEaa({required String uuid}) async {
    final res = await _channel
        .invokeMethod('registerEaa', <String, dynamic>{'uuid': uuid});

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> cancelEaaRegistration() async {
    final res = await _channel.invokeMethod('cancelEaaRegistration');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> deleteSpecifiedRegistration({required String uuid}) async {
    final res = await _channel.invokeMethod(
        'deleteSpecifiedRegistration', <String, dynamic>{'uuid': uuid});

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> deleteAllRegistration() async {
    final res = await _channel.invokeMethod('deleteAllRegistration');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> verifyEaa() async {
    final res = await _channel.invokeMethod('verifyEaa');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> requestRegisterStatus() async {
    final res = await _channel.invokeMethod('requestRegisterStatus');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> addEaaListener(
      {required Function(int) onRegister,
      required Function(int) onCancelRegistration,
      required Function(int) onDeleteRegistration,
      required Function(double?, String?, int) onVerify,
      required Function(List<String>?, int) onGetRegistrationStatus}) async {
    _onRegister = onRegister;
    _onCancelRegistration = onCancelRegistration;
    _onDeleteRegistration = onDeleteRegistration;
    _onVerify = onVerify;
    _onGetRegistrationStatus = onGetRegistrationStatus;

    final res = await _channel.invokeMethod('addEaaListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> removeEaaListener() async {
    _onRegister = null;
    _onCancelRegistration = null;
    _onDeleteRegistration = null;
    _onVerify = null;
    _onGetRegistrationStatus = null;

    final res = await _channel.invokeMethod('removeEaaListener');

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> setHearableEaaConfig(
      {required int featureRequiredNumber}) async {
    final res = await _channel.invokeMethod('setHearableEaaConfig',
        <String, dynamic>{'featureRequiredNumber': featureRequiredNumber});

    if (res == null) {
      return false;
    }
    return res;
  }

  Future<bool> setBatteryNotificationInterval({required int interval}) async {
    final res = await _channel.invokeMethod('setBatteryNotificationInterval',
        <String, dynamic>{'interval': interval});

    if (res == null) {
      return false;
    }
    return res;
  }
}
