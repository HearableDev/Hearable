import 'package:flutter/material.dart';
import 'package:hearable_device_sdk_sample/ear_acoustic_reg.dart';
import 'package:hearable_device_sdk_sample/ear_acoustic_test.dart';
import 'package:hearable_device_sdk_sample/ear_acoustic_del.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:hearable_device_sdk_sample/hearable_service_view.dart';
import 'package:hearable_device_sdk_sample/size_config.dart';
import 'package:hearable_device_sdk_sample/widgets.dart';
import 'package:hearable_device_sdk_sample/alert.dart';
import 'package:hearable_device_sdk_sample/bluetooth_manager.dart';

import 'package:hearable_device_sdk_sample_plugin/hearable_device_sdk_sample_plugin.dart';

class StartScan extends StatelessWidget {
  const StartScan({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BluetoothManager()),
      ],
      child: const _StartScan(title: 'ヒアラブルデバイスに接続しましょう'),
    );
  }
}

class _StartScan extends StatefulWidget {
  const _StartScan({required this.title});
  final String title;
  @override
  State<_StartScan> createState() => _StartScanState();
}

class _StartScanState extends State<_StartScan> {
  final HearableDeviceSdkSamplePlugin _samplePlugin =
      HearableDeviceSdkSamplePlugin();
  final BluetoothManager _bluetoothManager = BluetoothManager();

  var _selectedIndex = -1;
  var _selectedDevice = '';

  void _scanDevice() async {
    _selectedIndex = -1;
    _selectedDevice = '';
    // プログレスダイアログ
    _showProgressDialog(context, 'スキャン中');
    // デバイススキャン
    if (!(await _samplePlugin.scanHearableDevices())) {
      Navigator.of(context).pop();
      // エラーダイアログ
      Alert.showAlert(context, 'IllegalStateException');
    }
  }

  void _connectBle() async {
    // プログレスダイアログ
    _showProgressDialog(context, '接続中...');
    // BLE接続
    if (!(await _samplePlugin.connectBleToSpecifiedDevice(
        deviceId: _selectedDevice))) {
      Navigator.of(context).pop();
      // エラーダイアログ
      Alert.showAlert(context, 'IllegalStateException');
    }
  }

  // 選択可能なListView
  ListView _createDeviceListView(BuildContext context) {
    return ListView.builder(
        // デバイス数
        itemCount: _bluetoothManager.deviceList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: ListTile(
              selected: _selectedIndex == index ? true : false,
              //selectedTileColor: Colors.grey.withOpacity(0.3),
              title: Text(_bluetoothManager.deviceList[index].name),
              subtitle: Platform.isAndroid
                  ? Widgets.androidDeviceIdText(
                      _bluetoothManager.deviceList[index].deviceId)
                  : Widgets.iosDeviceIdText(
                      _bluetoothManager.deviceList[index].deviceId),
              trailing:
                  Text((_bluetoothManager.deviceList[index].rssi).toString()),
              onTap: () {
                if (index == _selectedIndex) {
                  _selectedIndex = -1;
                  _selectedDevice = '';
                } else {
                  _selectedIndex = index;
                  _selectedDevice =
                      _bluetoothManager.deviceList[index].deviceId;
                }
                setState(() {});
              },
            ),
          );
        });
  }

  void _showProgressDialog(BuildContext context, String text) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return AlertDialog(
            content: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 10),
                    Text(text)
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        elevation: 16,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.monitor_heart_outlined),
              title: const Text(('センサデータの確認')),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const HearableServiceView();
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
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(('耳音響認証の初期設定')),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const EarAcoustic();
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
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.psychology_alt_sharp),
              title: const Text(('耳音響認証の照合テスト')),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const EarAcousticTest();
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
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever_sharp),
              title: const Text(('登録した特徴量の削除')),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const EarAcousticDel();
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
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text(('ライセンス')),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const LicensePage();
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
                    ));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '<Step:1>\nケースから左右どちらかのヒアラブルデバイスを取り出し、"デバイススキャン開始"ボタンをタップ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: _scanDevice,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          backgroundColor: Colors.black),
                      child: const Text(
                        'デバイススキャン開始',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '<Step:2>\nスキャン後に下枠に表示されるデバイス名をタップ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 65,
                        height: SizeConfig.blockSizeVertical * 10,
                        child: Consumer<BluetoothManager>(
                            builder: ((context, bluetoothManager, _) =>
                                _createDeviceListView(context)))),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '<Step:3>\n文字の色が変わったことを確認し"接続ボタン"をタップ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: _connectBle,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          backgroundColor: Colors.black),
                      child: const Text(
                        '接続',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<BluetoothManager>(
                      builder: ((context, bluetoothManager, _) => Text(
                            bluetoothManager.isConnected
                                ? 'ヒアラブルデバイス接続状態：Connected'
                                : 'ヒアラブルデバイス接続状態：Disconnected',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ))),
                  const SizedBox(height: 30),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                                '<Step:4>\nヒアラブルデバイスの接続状態(Connected)を確認できたら左上の'),
                        WidgetSpan(
                            child: Icon(
                          Icons.menu,
                          size: 20,
                        )),
                        TextSpan(text: 'メニューから次の操作を選んでください。'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
