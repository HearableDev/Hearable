import Flutter
import UIKit
import Foundation

import hearable_device_sdk

public class SwiftHearableDeviceSdkSamplePlugin: NSObject, FlutterPlugin {

    static var channel: FlutterMethodChannel!

    private let service = HearableService.shared()
    private var hearableService: IHearableService?

    public static func register(with registrar: FlutterPluginRegistrar) {
        Self.channel = FlutterMethodChannel(name: "hearable_device_sdk_sample_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftHearableDeviceSdkSamplePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        switch method {
        case "startService":
            startService(call, result: result)
        case "stopService":
            stopService(call, result: result)
        case "scanHearableDevices":
            scanHearableDevices(call, result: result)
        case "connectBleToSpecifiedDevice":
            connectBleToSpecifiedDevice(call, result: result)
        case "disconnectBle":
            disconnectBle(call, result: result)
        case "registHearableStatusListener":
            registHearableStatusListener(call, result: result)
        case "addHearableBleListener":
            addHearableBleListener(call, result: result)
        case "unregistHearableStatusListener":
            unregistHearableStatusListener(call, result: result)
        case "removeHearableBleListener":
            removeHearableBleListener(call, result: result)
        case "startBatteryNotification":
            startBatteryNotification(call, result: result)
        case "stopBatteryNotification":
            stopBatteryNotification(call, result: result)
        case "addBatteryNotificationListener":
            addBatteryNotificationListener(call, result: result)
        case "removeBatteryNotificationListener":
            removeBatteryNotificationListener(call, result: result)
        case "startNineAxisSensorNotification":
            startNineAxisSensorNotification(call, result: result)
        case "stopNineAxisSensorNotification":
            stopNineAxisSensorNotification(call, result: result)
        case "addNineAxisSensorNotificationListener":
            addNineAxisSensorNotificationListener(call, result: result)
        case "removeNineAxisSensorNotificationListener":
            removeNineAxisSensorNotificationListener(call, result: result)
        case "startTemperatureNotification":
            startTemperatureNotification(call, result: result)
        case "stopTemperatureNotification":
            stopTemperatureNotification(call, result: result)
        case "addTemperatureNotificationListener":
            addTemperatureNotificationListener(call, result: result)
        case "removeTemperatureNotificationListener":
            removeTemperatureNotificationListener(call, result: result)
        case "startHeartRateNotification":
            startHeartRateNotification(call, result: result)
        case "stopHeartRateNotification":
            stopHeartRateNotification(call, result: result)
        case "addHeartRateNotificationListener":
            addHeartRateNotificationListener(call, result: result)
        case "removeHeartRateNotificationListener":
            removeHeartRateNotificationListener(call, result: result)
        case "startPpgNotification":
            startPpgNotification(call, result: result)
        case "stopPpgNotification":
            stopPpgNotification(call, result: result)
        case "addPpgNotificationListener":
            addPpgNotificationListener(call, result: result)
        case "removePpgNotificationListener":
            removePpgNotificationListener(call, result: result)
        case "registerEaa":
            registerEaa(call, result: result)
        case "cancelEaaRegistration":
            cancelEaaRegistration(call, result: result)
        case "deleteSpecifiedRegistration":
            deleteSpecifiedRegistration(call, result: result)
        case "deleteAllRegistration":
            deleteAllRegistration(call, result: result)
        case "verifyEaa":
            verifyEaa(call, result: result)
        case "requestRegisterStatus":
            requestRegisterStatus(call, result: result)
        case "addEaaListener":
            addEaaListener(call, result: result)
        case "removeEaaListener":
            removeEaaListener(call, result: result)
        case "setHearableEaaConfig":
            setHearableEaaConfig(call, result: result)
        case "setBatteryNotificationInterval":
            setBatteryNotificationInterval(call, result: result)
        default:
            result(nil)
        }
    }

    private func startService(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        hearableService = service.startService()
        result(true)
    }

    private func stopService(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        hearableService?.stopService()
        result(true)
    }

    private func scanHearableDevices(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.scanHearableDevices()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func connectBleToSpecifiedDevice(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
            let deviceId = args["deviceId"] as? String,
              let uuid = UUID(uuidString: deviceId) else {
                result(false)
                return
            }
        
        if let hearableService = hearableService {
            do {
                try hearableService.connectBle(macAddress: uuid)
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func disconnectBle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.disconnectBle()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func registHearableStatusListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.registHearableStatusListener(listener: HearableStatusListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func addHearableBleListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addHearableBleListener(listener: HearableBleResultListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func unregistHearableStatusListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.unregistHearableStatusListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func removeHearableBleListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.removeHearableBleListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func startBatteryNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.startBatteryNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func stopBatteryNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.stopBatteryNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func addBatteryNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addBatteryNotificationListener(listener: HearableBatteryNotificationListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func removeBatteryNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.removeBatteryNotificationListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func startNineAxisSensorNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.startNineAxisSensorNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func stopNineAxisSensorNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.stopNineAxisSensorNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func addNineAxisSensorNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addNineAxisSensorNotificationListener(listener: HearableNineAxisSensorNotificationListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func removeNineAxisSensorNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.removeNineAxisSensorNotificationListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func startTemperatureNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.startTemperatureNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func stopTemperatureNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.stopTemperatureNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func addTemperatureNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addTemperatureNotificationListener(listener: HearableTemperatureNotificationListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func removeTemperatureNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.removeTemperatureNotificationListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func startHeartRateNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.startHeartRateNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func stopHeartRateNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.stopHeartRateNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func addHeartRateNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addHeartRateNotificationListener(listener: HearableHeartRateNotificationListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func removeHeartRateNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.removeHeartRateNotificationListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func startPpgNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.startPpgNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func stopPpgNotification(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.stopPpgNotification()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func addPpgNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addPpgNotificationListener(listener: HearablePpgNotificationListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func removePpgNotificationListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            try? hearableService.removePpgNotificationListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func registerEaa(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
            let uuidString = args["uuid"] as? String,
              let uuid = UUID(uuidString: uuidString) else {
                result(false)
                return
            }
        
        if let hearableService = hearableService {
            do {
                try hearableService.registerEaa(uuid: uuid)
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func cancelEaaRegistration(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.cancelEaaRegistration()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func deleteSpecifiedRegistration(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
            let uuidString = args["uuid"] as? String,
              let uuid = UUID(uuidString: uuidString) else {
                result(false)
                return
            }
        
        if let hearableService = hearableService {
            do {
                try hearableService.deleteRegistration(uuid: uuid)
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func deleteAllRegistration(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.deleteRegistration()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func verifyEaa(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.verifyEaa()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func requestRegisterStatus(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            do {
                try hearableService.requestRegisterStatus()
                result(true)
            } catch {
                result(false)
                return
            }
        } else {
            result(false)
        }
    }

    private func addEaaListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.addEaaListener(listener: HearableEaaListener())
            result(true)
        } else {
            result(false)
        }
    }

    private func removeEaaListener(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let hearableService = hearableService {
            hearableService.removeEaaListener()
            result(true)
        } else {
            result(false)
        }
    }

    private func setHearableEaaConfig(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
            let num = args["featureRequiredNumber"] as? Int else {
                result(false)
                return
            }
        
        if let hearableService = hearableService {
            hearableService.setHearableEaaConfig(config: HearableEaaConfig(featureRequiredNumber: num))
            result(true)
        } else {
            result(false)
        }
    }

    private func setBatteryNotificationInterval(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
            let interval = args["interval"] as? Int else {
                result(false)
                return
            }
        
        if let hearableService = hearableService {
            hearableService.setBatteryNotificationInterval(interval: interval)
            result(true)
        } else {
            result(false)
        }
    }
    
    class HearableBleResultListener: IHearableBleResultListener {
        public func onConnect(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onConnect", arguments:resultCode)
        }

        public func onDisconnect(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onDisconnect", arguments:resultCode)
        }

        public func onScanResult(deviceList: Array<IHearableDeviceInfo>?, resultCode: Int) {
            var result: NSDictionary
            if let deviceList = deviceList {
                var list: NSMutableArray = []
                for device in deviceList {
                    let info: NSDictionary = ["deviceId": device.getUuid(), "name": device.getName(), "rssi": device.getRssi()]
                    list.add(info)
                }
                result = ["deviceList": list.copy(), "resultCode":resultCode]
            } else {
                result = ["deviceList":NSNull(), "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onScanResult", arguments:result)
        }
    }
    
    class HearableStatusListener: IHearableStatusListener {
        public func onChangeStatus(status: IHearableStatus) {
            let hearableStatus: NSDictionary = ["isConnected": status.isBluetoothLEConnected(), "deviceName": status.getBleConnectDeviceName()]
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onChangeStatus", arguments:hearableStatus)
        }
    }
    
    class HearableBatteryNotificationListener: IHearableBatteryNotificationListener {
        public func onStartNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStartBatteryNotification", arguments:resultCode)
        }

        public func onStopNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStopBatteryNotification", arguments:resultCode)
        }

        public func onReceiveNotification(data: Data?, resultCode: Int) {
            var received: NSDictionary
            if let data = data {
                let flutterStandardTypedData = FlutterStandardTypedData(bytes: data)
                received = ["data":flutterStandardTypedData, "resultCode":resultCode]
            } else {
                received = ["data":NSNull.self(), "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onReceiveBatteryNotification", arguments:received)
        }
    }
    
    class HearableNineAxisSensorNotificationListener: IHearableNineAxisSensorNotificationListener {
        func onStartNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStartNineAxisSensorNotification", arguments:resultCode)
        }

        func onStopNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStopNineAxisSensorNotification", arguments:resultCode)
        }

        func onReceiveNotification(data: Data?, resultCode: Int) {
            var received: NSDictionary
            if let data = data {
                let flutterStandardTypedData = FlutterStandardTypedData(bytes: data)
                received = ["data":flutterStandardTypedData, "resultCode":resultCode]
            } else {
                received = ["data":NSNull(), "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onReceiveNineAxisSensorNotification", arguments:received)
        }
    }
    
    class HearableTemperatureNotificationListener: IHearableTemperatureNotificationListener {
        func onStartNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStartTemperatureNotification", arguments:resultCode)
        }

        func onStopNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStopTemperatureNotification", arguments:resultCode)
        }

        func onReceiveNotification(data: Data?, resultCode: Int) {
            var received: NSDictionary
            if let data = data {
                let flutterStandardTypedData = FlutterStandardTypedData(bytes: data)
                received = ["data":flutterStandardTypedData, "resultCode":resultCode]
            } else {
                received = ["data":NSNull(), "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onReceiveTemperatureNotification", arguments:received)
        }
    }
    
    class HearableHeartRateNotificationListener: IHearableHeartRateNotificationListener {
        func onStartNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStartHeartRateNotification", arguments:resultCode)
        }

        func onStopNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStopHeartRateNotification", arguments:resultCode)
        }

        func onReceiveNotification(data: Data?, resultCode: Int) {
            var received: NSDictionary
            if let data = data {
                let flutterStandardTypedData = FlutterStandardTypedData(bytes: data)
                received = ["data":flutterStandardTypedData, "resultCode":resultCode]
            } else {
                received = ["data":NSNull(), "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onReceiveHeartRateNotification", arguments:received)
        }
    }
    
    class HearablePpgNotificationListener: IHearablePpgNotificationListener {
        func onStartNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStartPpgNotification", arguments:resultCode)
        }

        func onStopNotification(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onStopPpgNotification", arguments:resultCode)
        }

        func onReceiveNotification(data: Data?, resultCode: Int) {
            var received: NSDictionary
            if let data = data {
                let flutterStandardTypedData = FlutterStandardTypedData(bytes: data)
                received = ["data":flutterStandardTypedData, "resultCode":resultCode]
            } else {
                received = ["data":NSNull(), "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onReceivePpgNotification", arguments:received)
        }
    }
    
    class HearableEaaListener: IHearableEaaListener {
        public func onRegister(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onRegister", arguments:resultCode)
        }

        public func onCancelRegistration(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onCancelRegistration", arguments:resultCode)
        }

        public func onDeleteRegistration(resultCode: Int) {
            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onDeleteRegistration", arguments:resultCode)
        }

        public func onVerify(score: NSNumber?, uuid: UUID?, resultCode: Int) {
            var result: NSDictionary
            if let score = score,
                let uuid = uuid {
                    result = ["score": Double(score.floatValue), "uuid": uuid.uuidString , "resultCode":resultCode]
                } else {
                    result = ["score": NSNull(), "uuid": NSNull() , "resultCode":resultCode]
                }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onVerify", arguments:result)
        }

        public func onGetRegistrationStatus(uuids: [UUID]?, resultCode: Int) {
            var result: NSDictionary
            if let uuids = uuids {
                var list: NSMutableArray = []
                for uuid in uuids {
                    list.add(uuid.uuidString)
                }
                result = ["uuids": list.copy(), "resultCode":resultCode]
            } else {
                result = ["uuids": NSNull() , "resultCode":resultCode]
            }

            SwiftHearableDeviceSdkSamplePlugin.channel.invokeMethod("onGetRegistrationStatus", arguments:result)
        }
    }
}
