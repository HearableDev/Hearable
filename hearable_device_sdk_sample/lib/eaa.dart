import 'package:flutter/foundation.dart';

import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

class Eaa extends ChangeNotifier {
  final HearableDeviceSdkSamplePlugin _samplePlugin =
      HearableDeviceSdkSamplePlugin();
  int featureGetCount = 0;
  String registeringUserUuid = '';

  int? _resultCode = 0;
  double? _score;
  String? _uuid;
  List<String> _uuids = [];

  String _resultStr = '';

  Function()? _registerCallback;
  Function()? _cancelRegistrationCallback;
  Function()? _deleteRegistrationCallback;
  Function()? _verifyCallback;
  Function()? _getRegistrationStatusCallback;

  static final Eaa _instance = Eaa._internal();

  factory Eaa() {
    return _instance;
  }

  Eaa._internal();

  int? get resultCode => _resultCode;
  double? get score => _score;
  String? get uuid => _uuid;
  List<String> get uuids => _uuids;

  String get resultStr => _resultStr;

  void createResultString(
      int? resultCode, double? score, String? uuid, List<String>? uuids) {
    _resultStr = '';

    if (_resultCode != null) {
      _resultStr += 'result code: $_resultCode\n';
    }

    if (score != null) {
      _resultStr += 'score: $score\n';
    }

    if (uuid != null) {
      _resultStr += 'uuid: $uuid\n';
    }

    if (uuids != null) {
      _resultStr += 'uuid:\n';
      for (var uuid in uuids) {
        _resultStr += '$uuid\n';
      }
    }

    notifyListeners();
  }

  Future<bool> addEaaListener({
    required Function()? registerCallback,
    required Function()? cancelRegistrationCallback,
    required Function()? deleteRegistrationCallback,
    required Function()? verifyCallback,
    required Function()? getRegistrationStatusCallback,
  }) async {
    _registerCallback = registerCallback;
    _cancelRegistrationCallback = cancelRegistrationCallback;
    _deleteRegistrationCallback = deleteRegistrationCallback;
    _verifyCallback = verifyCallback;
    _getRegistrationStatusCallback = getRegistrationStatusCallback;

    final res = await _samplePlugin.addEaaListener(
        onRegister: _onRegister,
        onCancelRegistration: _onCancelRegistration,
        onDeleteRegistration: _onDeleteRegistration,
        onVerify: _onVerify,
        onGetRegistrationStatus: _onGetRegistrationStatus);
    if (!res) {
      print('addEaaListener: IllegalArgumentException');
    }
    return res;
  }

  void removeEaaListener() {
    _samplePlugin.removeEaaListener();
  }

  void _onRegister(int resultCode) {
    _resultCode = resultCode;
    createResultString(resultCode, null, null, null);

    if (resultCode == 0 || resultCode == -200 || resultCode == -203) {
      featureGetCount++;
    }

    if (_registerCallback != null) {
      _registerCallback!();
    }

    notifyListeners();
  }

  void _onCancelRegistration(int resultCode) {
    _resultCode = resultCode;
    createResultString(resultCode, null, null, null);
    if (_cancelRegistrationCallback != null) {
      _cancelRegistrationCallback!();
    }
    featureGetCount = 0;
    notifyListeners();
  }

  void _onDeleteRegistration(int resultCode) {
    _resultCode = resultCode;
    createResultString(resultCode, null, null, null);
    if (_deleteRegistrationCallback != null) {
      _deleteRegistrationCallback!();
    }
    notifyListeners();
  }

  void _onVerify(double? score, String? uuid, int resultCode) {
    if (resultCode == 0 && score != null && uuid != null) {
      _score = score;
      _uuid = uuid;
    }

    _resultCode = resultCode;
    createResultString(resultCode, score, uuid, null);
    if (_verifyCallback != null) {
      _verifyCallback!();
    }
    notifyListeners();
  }

  void _onGetRegistrationStatus(List<String>? uuids, int resultCode) {
    if (resultCode == 0 && uuids != null) {
      _uuids = uuids;
    }

    _resultCode = resultCode;
    createResultString(resultCode, null, null, uuids);
    if (_getRegistrationStatusCallback != null) {
      _getRegistrationStatusCallback!();
    }
    notifyListeners();
  }
}
