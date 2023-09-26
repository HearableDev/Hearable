//import 'package:flutter/foundation.dart';

enum ResultMessage {
  success('success'),
  UNKNOWN('unknown'),
  REQUEST_TIMEOUT('Request timeout'),
  FAILED_STATUS_UNMATCH('Failed status unmatch'),
  FATAL_ERROR('Fatal error'),
  UNSUPPORTED_BLUETOOTH('Unsupported bluetooth'),
  BLUETOOTH_DISABLED('Bluetooth disabled'),
  BLUETOOTH_PERMISSION_DENIED('Bluetooth permission denied'),
  BLUETOOTH_IS_BUSY('Bluetooth is busy'),
  FAILED_FIND_CONNECT_BLE_DEVICE('Failed find connect ble device'),
  BLE_IS_ALREADY_CONNECTED('BLE is already connected'),
  BLE_CONNECTION_OPERATION_ERROR('BLE connection operation error'),
  BLE_SERVICE_DISCOVER_ERROR('BLE service discover error'),
  BLE_NOT_FOUND_SERVICE('BLE not found service'),
  BLE_DISCONNECTED('BLE disconnected'),
  BLE_DESCRIPTOR_WRITE_ERROR('BLE descriptor write error'),
  BLE_CHARACTERISTIC_WRITE_ERROR('BLE characteristic write error'),
  BLE_CHARACTERISTIC_READ_ERROR('BLE characteristic read error'),
  NOT_SUFFICIENT_FEATURE_COLLECT('Not sufficient feature collect'),
  EAA_IS_BUSY('EAA is busy'),
  FAILED_FEATURE_COLLECT('Failed feature collect'),
  FAILED_REGISTER_PARAMETERS('Failed register parameters'),
  FAILED_DELETE_REGISTRATION('Failed delete registration'),
  FAILED_MATCHING_OF_EAA('Failed matching of EAA'),
  FAILED_GET_REGISTRATION_STATUS('Failed get registration status'),
  UNEXPECTED_DATA('Unexpected data'),
  STATUS_FAILED_BLE_PAIRED('Status failed BLE paired'),
  STATUS_FAILED_BLE_KEY_EXCHANGE('Status failed BLE key exchange'),
  other('other');

  final String message;
  const ResultMessage(this.message);

  factory ResultMessage.fromCode(int code) {
    switch (code) {
      case 0:
        return ResultMessage.success;
      case -1:
        return ResultMessage.UNKNOWN;
      case -2:
        return ResultMessage.REQUEST_TIMEOUT;
      case -3:
        return ResultMessage.FAILED_STATUS_UNMATCH;
      case -4:
        return ResultMessage.FATAL_ERROR;
      case -100:
        return ResultMessage.UNSUPPORTED_BLUETOOTH;
      case -101:
        return ResultMessage.BLUETOOTH_DISABLED;
      case -102:
        return ResultMessage.BLUETOOTH_PERMISSION_DENIED;
      case -103:
        return ResultMessage.BLUETOOTH_IS_BUSY;
      case -104:
        return ResultMessage.FAILED_FIND_CONNECT_BLE_DEVICE;
      case -105:
        return ResultMessage.BLE_IS_ALREADY_CONNECTED;
      case -106:
        return ResultMessage.BLE_CONNECTION_OPERATION_ERROR;
      case -107:
        return ResultMessage.BLE_SERVICE_DISCOVER_ERROR;
      case -108:
        return ResultMessage.BLE_NOT_FOUND_SERVICE;
      case -109:
        return ResultMessage.BLE_DISCONNECTED;
      case -110:
        return ResultMessage.BLE_DESCRIPTOR_WRITE_ERROR;
      case -111:
        return ResultMessage.BLE_CHARACTERISTIC_WRITE_ERROR;
      case -112:
        return ResultMessage.BLE_CHARACTERISTIC_READ_ERROR;
      case -200:
        return ResultMessage.NOT_SUFFICIENT_FEATURE_COLLECT;
      case -201:
        return ResultMessage.EAA_IS_BUSY;
      case -202:
        return ResultMessage.FAILED_FEATURE_COLLECT;
      case -203:
        return ResultMessage.FAILED_REGISTER_PARAMETERS;
      case -204:
        return ResultMessage.FAILED_DELETE_REGISTRATION;
      case -205:
        return ResultMessage.FAILED_MATCHING_OF_EAA;
      case -206:
        return ResultMessage.FAILED_GET_REGISTRATION_STATUS;
      case -300:
        return ResultMessage.UNEXPECTED_DATA;
      case -2130706384:
        return ResultMessage.STATUS_FAILED_BLE_PAIRED;
      case -2130706400:
        return ResultMessage.STATUS_FAILED_BLE_KEY_EXCHANGE;
      default:
        return ResultMessage.other;
    }
  }
}
