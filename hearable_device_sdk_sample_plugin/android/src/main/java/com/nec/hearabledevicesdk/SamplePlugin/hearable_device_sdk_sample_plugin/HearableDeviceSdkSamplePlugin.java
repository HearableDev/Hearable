package com.nec.hearabledevicesdk.SamplePlugin.hearable_device_sdk_sample_plugin;

import android.content.Context;
import android.app.Activity;
import android.Manifest;
import android.os.Handler;
import android.os.Looper;
import android.os.Build;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.nec.hearable.*;

/** HearableDeviceSdkSamplePlugin */
public class HearableDeviceSdkSamplePlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private static final String LOG_TAG = HearableDeviceSdkSamplePlugin.class.getSimpleName();

    private MethodChannel channel;
    private Activity activity;
    private Context context;
    private Handler handler;

    private IHearableService hearableService;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "hearable_device_sdk_sample_plugin");
        channel.setMethodCallHandler(this);

        this.context = flutterPluginBinding.getApplicationContext();
        // channel.invokeMethod()はUIスレッドで実行しなければならない
        this.handler = new Handler(Looper.getMainLooper());
    }
    
    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding activityPluginBinding) {
        activity = activityPluginBinding.getActivity();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "startService":
                startService(call, result);
                break;
            case "stopService":
                stopService(call, result);
                break;
            case "scanHearableDevices":
                scanHearableDevices(call, result);
                break;
            case "connectBleToSpecifiedDevice":
                connectBleToSpecifiedDevice(call, result);
                break;
            case "connectBleToClassic":
                connectBleToClassic(call, result);
                break;
            case "disconnectBle":
                disconnectBle(call, result);
                break;
            case "registHearableStatusListener":
                registHearableStatusListener(call, result);
                break;
            case "addHearableBleListener":
                addHearableBleListener(call, result);
                break;
            case "unregistHearableStatusListener":
                unregistHearableStatusListener(call, result);
                break;
            case "removeHearableBleListener":
                removeHearableBleListener(call, result);
                break;
            case "startBatteryNotification":
                startBatteryNotification(call, result);
                break;
            case "stopBatteryNotification":
                stopBatteryNotification(call, result);
                break;
            case "addBatteryNotificationListener":
                addBatteryNotificationListener(call, result);
                break;
            case "removeBatteryNotificationListener":
                removeBatteryNotificationListener(call, result);
                break;
            case "startNineAxisSensorNotification":
                startNineAxisSensorNotification(call, result);
                break;
            case "stopNineAxisSensorNotification":
                stopNineAxisSensorNotification(call, result);
                break;
            case "addNineAxisSensorNotificationListener":
                addNineAxisSensorNotificationListener(call, result);
                break;
            case "removeNineAxisSensorNotificationListener":
                removeNineAxisSensorNotificationListener(call, result);
                break;
            case "startTemperatureNotification":
                startTemperatureNotification(call, result);
                break;
            case "stopTemperatureNotification":
                stopTemperatureNotification(call, result);
                break;
            case "addTemperatureNotificationListener":
                addTemperatureNotificationListener(call, result);
                break;
            case "removeTemperatureNotificationListener":
                removeTemperatureNotificationListener(call, result);
                break;
            case "startHeartRateNotification":
                startHeartRateNotification(call, result);
                break;
            case "stopHeartRateNotification":
                stopHeartRateNotification(call, result);
                break;
            case "addHeartRateNotificationListener":
                addHeartRateNotificationListener(call, result);
                break;
            case "removeHeartRateNotificationListener":
                removeHeartRateNotificationListener(call, result);
                break;
            case "startPpgNotification":
                startPpgNotification(call, result);
                break;
            case "stopPpgNotification":
                stopPpgNotification(call, result);
                break;
            case "addPpgNotificationListener":
                addPpgNotificationListener(call, result);
                break;
            case "removePpgNotificationListener":
                removePpgNotificationListener(call, result);
                break;
            case "registerEaa":
                registerEaa(call, result);
                break;
            case "cancelEaaRegistration":
                cancelEaaRegistration(call, result);
                break;
            case "deleteSpecifiedRegistration":
                deleteSpecifiedRegistration(call, result);
                break;
            case "deleteAllRegistration":
                deleteAllRegistration(call, result);
                break;
            case "verifyEaa":
                verifyEaa(call, result);
                break;
            case "requestRegisterStatus":
                requestRegisterStatus(call, result);
                break;
            case "addEaaListener":
                addEaaListener(call, result);
                break;
            case "removeEaaListener":
                removeEaaListener(call, result);
                break;
            case "setHearableEaaConfig":
                setHearableEaaConfig(call, result);
                break;
            case "setBatteryNotificationInterval":
                setBatteryNotificationInterval(call, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void startService(@NonNull MethodCall call, @NonNull Result result) {
        String[] list = new String[3];
        if (Build.VERSION.SDK_INT >= 31) {
            list = new String[] {Manifest.permission.BLUETOOTH_SCAN,
                Manifest.permission.BLUETOOTH_CONNECT};
            // list.add(Manifest.permission.BLUETOOTH_SCAN);
            // list.add(Manifest.permission.BLUETOOTH_CONNECT);
        } else if (Build.VERSION.SDK_INT >= 23) {
            list = new String[] {Manifest.permission.BLUETOOTH,
                Manifest.permission.BLUETOOTH_ADMIN,
                Manifest.permission.ACCESS_FINE_LOCATION};
            // list.add(Manifest.permission.BLUETOOTH);
            // list.add(Manifest.permission.BLUETOOTH_ADMIN);
            // list.add(Manifest.permission.ACCESS_FINE_LOCATION);
        }
        ActivityCompat.requestPermissions(activity, list, 0);

        hearableService = HearableService.startService(context);
    }

    private void stopService(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            hearableService.stopService();
        }
    }

    private void scanHearableDevices(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.scanHearableDevices();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void connectBleToSpecifiedDevice(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                String deviceId = call.argument("deviceId");
                hearableService.connectBle(deviceId);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void connectBleToClassic(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.connectBle();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void disconnectBle(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.disconnectBle();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void registHearableStatusListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableStatusListener listener = new IHearableStatusListener() {
                @Override
                public void onChangeStatus(IHearableStatus status) {
                    Log.d(LOG_TAG, "onChangeStatus");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> statusMap = new HashMap<>();
                            statusMap.put("isConnected", status.isBluetoothLEConnected());
                            statusMap.put("deviceName", status.getBleConnectDeviceName());
                            channel.invokeMethod("onChangeStatus", statusMap);
                        }
                    });
                }

            };
            try {
                hearableService.registHearableStatusListener(listener);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addHearableBleListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableBleResultListener listener = new IHearableBleResultListener() {
                @Override
                public void onConnect(int resultCode) {
                    Log.d(LOG_TAG, "onConnect");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onConnect", resultCode);
                        }
                    });
                }

                @Override
                public void onDisconnect(int resultCode) {
                    Log.d(LOG_TAG, "onDisconnect");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onDisconnect", resultCode);
                        }
                    });
                }

                @Override
                public void onScanResult(List<IHearableDeviceInfo> deviceList, int resultCode) {
                    Log.d(LOG_TAG, "onScanResult");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> result = new HashMap<>();

                            result.put("resultCode", resultCode);
                            if (deviceList == null) {
                                result.put("deviceList", null);
                            } else {
                                ArrayList<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
                                for (IHearableDeviceInfo device :deviceList) {
                                    Map<String,Object> deviceMap = new HashMap<>();
                                    deviceMap.put("deviceId", device.getMacAddress());
                                    deviceMap.put("name", device.getName());
                                    deviceMap.put("rssi", device.getRssi());

                                    list.add(deviceMap);
                                }
                                result.put("deviceList", list);
                            }
                            channel.invokeMethod("onScanResult", result);
                        }
                    });
                }
            };

            try {
                hearableService.addHearableBleListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void unregistHearableStatusListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.unregistHearableStatusListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removeHearableBleListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removeHearableBleListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void startBatteryNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.startBatteryNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void stopBatteryNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.stopBatteryNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addBatteryNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableBatteryNotificationListener listener = new IHearableBatteryNotificationListener() {
                @Override
                public void onStartNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStartBatteryNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStartBatteryNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onStopNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStopBatteryNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStopBatteryNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onReceiveNotification(byte[] data, int resultCode) {
                    Log.d(LOG_TAG, "onReceiveBatteryNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> received = new HashMap<>();
                            received.put("data", data);
                            received.put("resultCode", resultCode);
                            channel.invokeMethod("onReceiveBatteryNotification", received);
                        }
                    });
                }
            };

            try {
                hearableService.addBatteryNotificationListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removeBatteryNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removeBatteryNotificationListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void startNineAxisSensorNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.startNineAxisSensorNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void stopNineAxisSensorNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.stopNineAxisSensorNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addNineAxisSensorNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableNineAxisSensorNotificationListener listener = new IHearableNineAxisSensorNotificationListener() {
                @Override
                public void onStartNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStartNineAxisSensorNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStartNineAxisSensorNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onStopNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStopNineAxisSensorNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStopNineAxisSensorNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onReceiveNotification(byte[] data, int resultCode) {
                    Log.d(LOG_TAG, "onReceiveNineAxisSensorNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> received = new HashMap<>();
                            received.put("data", data);
                            received.put("resultCode", resultCode);
                            channel.invokeMethod("onReceiveNineAxisSensorNotification", received);
                        }
                    });
                }
            };

            try {
                hearableService.addNineAxisSensorNotificationListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removeNineAxisSensorNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removeNineAxisSensorNotificationListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void startTemperatureNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.startTemperatureNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void stopTemperatureNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.stopTemperatureNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addTemperatureNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableTemperatureNotificationListener listener = new IHearableTemperatureNotificationListener() {
                @Override
                public void onStartNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStartTemperatureNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStartTemperatureNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onStopNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStopTemperatureNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStopTemperatureNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onReceiveNotification(byte[] data, int resultCode) {
                    Log.d(LOG_TAG, "onReceiveTemperatureNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> received = new HashMap<>();
                            received.put("data", data);
                            received.put("resultCode", resultCode);
                            channel.invokeMethod("onReceiveTemperatureNotification", received);
                        }
                    });
                }
            };

            try {
                hearableService.addTemperatureNotificationListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removeTemperatureNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removeTemperatureNotificationListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void startHeartRateNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.startHeartRateNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void stopHeartRateNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.stopHeartRateNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addHeartRateNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableHeartRateNotificationListener listener = new IHearableHeartRateNotificationListener() {
                @Override
                public void onStartNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStartHeartRateNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStartHeartRateNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onStopNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStopHeartRateNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStopHeartRateNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onReceiveNotification(byte[] data, int resultCode) {
                    Log.d(LOG_TAG, "onReceiveHeartRateNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> received = new HashMap<>();
                            received.put("data", data);
                            received.put("resultCode", resultCode);
                            channel.invokeMethod("onReceiveHeartRateNotification", received);
                        }
                    });
                }
            };

            try {
                hearableService.addHeartRateNotificationListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removeHeartRateNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removeHeartRateNotificationListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void startPpgNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.startPpgNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void stopPpgNotification(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.stopPpgNotification();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addPpgNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearablePpgNotificationListener listener = new IHearablePpgNotificationListener() {
                @Override
                public void onStartNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStartPpgNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStartPpgNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onStopNotification(int resultCode) {
                    Log.d(LOG_TAG, "onStopPpgNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onStopPpgNotification", resultCode);
                        }
                    });
                }

                @Override
                public void onReceiveNotification(byte[] data, int resultCode) {
                    Log.d(LOG_TAG, "onReceivePpgNotification");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> received = new HashMap<>();
                            received.put("data", data);
                            received.put("resultCode", resultCode);
                            channel.invokeMethod("onReceivePpgNotification", received);
                        }
                    });
                }
            };

            try {
                hearableService.addPpgNotificationListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removePpgNotificationListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removePpgNotificationListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void registerEaa(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            String uuidString = call.argument("uuid");
            if (uuidString.isEmpty()) {
                result.success(false);
                return;
            }
            // String uuidString = call.argument("uuid");
            UUID uuid = UUID.fromString(uuidString);

            try {
                hearableService.registerEaa(uuid);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void cancelEaaRegistration(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.cancelEaaRegistration();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void deleteSpecifiedRegistration(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            String uuidString = call.argument("uuid");
            if (uuidString.isEmpty()) {
                result.success(false);
                return;
            }
            UUID uuid = UUID.fromString(uuidString);

            try {
                hearableService.deleteRegistration(uuid);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void deleteAllRegistration(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.deleteRegistration();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void verifyEaa(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.verifyEaa();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void requestRegisterStatus(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.requestRegisterStatus();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void addEaaListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            IHearableEaaListener listener = new IHearableEaaListener() {
                @Override
                public void onRegister(int resultCode) {
                    Log.d(LOG_TAG, "onRegister");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onRegister", resultCode);
                        }
                    });
                }

                @Override
                public void onCancelRegistration(int resultCode) {
                    Log.d(LOG_TAG, "onCancelRegistration");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onCancelRegistration", resultCode);
                        }
                    });
                }

                @Override
                public void onDeleteRegistration(int resultCode) {
                    Log.d(LOG_TAG, "onDeleteRegistration");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            channel.invokeMethod("onDeleteRegistration", resultCode);
                        }
                    });
                }

                @Override
                public void onVerify(Float score, UUID uuid, int resultCode) {
                    Log.d(LOG_TAG, "onVerify");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> result = new HashMap<>();
                            if (score == null) {
                                result.put("score", null);
                                result.put("uuid", null);
                            } else {
                                Double _score = Double.parseDouble(((Float) score).toString());
                                result.put("score", _score);
                                result.put("uuid", uuid.toString());
                            }
                            result.put("resultCode", resultCode);
                            channel.invokeMethod("onVerify", result);
                        }
                    });
                }

                @Override
                public void onGetRegistrationStatus(UUID[] uuids, int resultCode) {
                    Log.d(LOG_TAG, "onGetRegistrationStatus");
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            Map<String,Object> result = new HashMap<>();
                            if (uuids == null) {
                                result.put("uuids", null);
                            } else {
                                ArrayList<String> list = new ArrayList<String>();
                                for (UUID uuid :uuids) {
                                    list.add(uuid.toString());
                                }
                                result.put("uuids", list);
                            }
                            
                            result.put("resultCode", resultCode);
                            channel.invokeMethod("onGetRegistrationStatus", result);
                        }
                    });
                }
            };

            try {
                hearableService.addEaaListener(listener);
                result.success(true);
            } catch (Exception e) {
                Log.i(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void removeEaaListener(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            try {
                hearableService.removeEaaListener();
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void setHearableEaaConfig(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            int featureRequiredNumber = call.argument("featureRequiredNumber");

            try {
                hearableService.setHearableEaaConfig(new HearableEaaConfig(featureRequiredNumber));
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    private void setBatteryNotificationInterval(@NonNull MethodCall call, @NonNull Result result) {
        if (hearableService != null) {
            int interval = call.argument("interval");

            try {
                hearableService.setBatteryNotificationInterval(interval);
                result.success(true);
            } catch (Exception e) {
                Log.d(LOG_TAG, e.toString());
                result.success(false);
                return;
            }
        } else {
            result.success(false);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        hearableService = null;
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onDetachedFromActivity() {
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding activityPluginBinding) {
    }
}
