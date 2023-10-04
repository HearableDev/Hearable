import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearable_device_sdk_sample/start_scan.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:hearable_device_sdk_sample/config.dart';
import 'package:hearable_device_sdk_sample/alert.dart';
import 'package:hearable_device_sdk_sample/result_message.dart';
import 'package:hearable_device_sdk_sample/bluetooth_manager.dart';
import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ヒアラブル機能テストアプリ',
    home: const StartScreen(),
    theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.black)),
  ));
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BluetoothManager()),
      ],
      child: const _StartScreen(title: 'ヒアラブルデバイスに接続しましょう'),
    );
  }
}

class _StartScreen extends StatefulWidget {
  const _StartScreen({required this.title});
  final String title;
  @override
  State<_StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<_StartScreen> {
  final HearableDeviceSdkSamplePlugin _samplePlugin =
      HearableDeviceSdkSamplePlugin();
  final BluetoothManager _bluetoothManager = BluetoothManager();

  void _startService() async {
    // ヒアラブルサービス開始
    Platform.isAndroid
        ? _samplePlugin.startService()
        : await _samplePlugin.startService();

    bool res = true;
    res = await _bluetoothManager.addHearableBleListener(
        connectCallback: _connectCallback,
        disconnectCallback: _disconnectCallback,
        scanCallback: _scanCallback);
    res = await _bluetoothManager.registHearableStatusListener();
    res = await _samplePlugin.setHearableEaaConfig(
        featureRequiredNumber: Config().featureRequiredNumber);
    res = await _samplePlugin.setBatteryNotificationInterval(
        interval: Config().batteryNotificationInterval);

    if (!res) {
      Alert.showAlert(context, 'IllegalArgumentException');
    }
  }

  void _connectCallback(int resultCode) {
    Navigator.of(context).pop();
    // エラーダイアログ
    if (resultCode != 0) {
      Alert.showAlert(context, ResultMessage.fromCode(resultCode).message);
    }
  }

  void _disconnectCallback(int resultCode) {
    // エラーダイアログ
    if (resultCode != 0) {
      Alert.showAlert(context, ResultMessage.fromCode(resultCode).message);
    }
  }

  void _scanCallback(int resultCode) {
    Navigator.of(context).pop();
    // エラーダイアログ
    if (resultCode != 0) {
      Alert.showAlert(context, ResultMessage.fromCode(resultCode).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'ヒアラブルデバイス機能テストアプリ',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/hearable.jpg'),
              const Text(
                'このサンプルアプリについて',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('ヒアラブルデバイスとの接続確認が行えます。'),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                  onPressed: () {
                    _startService();
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const StartScan(title: '接続開始');
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const Offset begin = Offset(1.0, 0.0); // 右から左
                          // final Offset begin = Offset(-1.0, 0.0); // 左から右
                          const Offset end = Offset.zero;
                          final Animatable<Offset> tween =
                              Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: Curves.easeInOut));
                          final Animation<Offset> offsetAnimation =
                              animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    '早速始める',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ));
  }
}
