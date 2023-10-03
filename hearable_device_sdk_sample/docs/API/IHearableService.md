# IHearableService
ヒアラブルサービスのインターフェース

## public interface IHearableService

### メソッド

|関数|説明|
|:--|:--|
|void stopService()|ヒアラブルサービスを停止する。<br>他のアプリケーションがヒアラブルサービスを使用中の場合、このアプリケーションとの連携を切断する。 |
|void scanHearableDevices()|ヒアラブルデバイスを検索する。<br>@throws IllegalStateException リスナー未登録|
|void connectBle(String macAddress)|指定したMACアドレスを保持するヒアラブルデバイスとのBLE接続をする。<br>@param macAddress 接続対象のヒアラブルデバイスのMACアドレス <br>@throws IllegalStateException リスナー未登録<br>@throws IllegalArgumentException 不正な入力値|
|void connectBle()|現在BluetoothClassic接続しているヒアラブルデバイスとBLE接続をする。<br>@throws IllegalStateException リスナー未登録|
|void disconnectBle()|ヒアラブルデバイスとのBLE切断をする。<br>@throws IllegalStateException リスナー未登録|
|void registHearableStatusListener(IHearableStatusListener listener)|デバイス接続状況の通知を受信するリスナーを登録する。<br>@param listener 通知を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void addHearableBleListener(IHearableBleResultListener listener)|BLE接続関連機能の実行結果を受信するリスナーを登録する。<br>@param listener 実行結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void unregistHearableStatusListener()|デバイス接続状況の通知を受信するリスナーを解除する。<br>@throws IllegalStateException リスナー未登録|
|void removeHearableBleListener()|BLE接続関連機能のリスナーの登録解除を行う。<br>@throws IllegalStateException リスナー未登録|
|void startBatteryNotification()|バッテリー情報の取得を開始する。<br>@throws IllegalStateException リスナー未登録|
|void stopBatteryNotification()|バッテリー情報の取得を終了する。<br>@throws IllegalStateException リスナー未登録|
|void addBatteryNotificationListener(IHearableBatteryNotificationListener listener)|バッテリー情報取得の結果を受信するリスナーを登録する。<br>@param listener 結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void removeBatteryNotificationListener()|バッテリー情報取得のリスナーの登録解除を行う。<br>@throws IllegalStateException リスナー未登録|
|void startNineAxisSensorNotification()|9軸センサー情報の取得を開始する。<br>@throws IllegalStateException リスナー未登録|
|void stopNineAxisSensorNotification()|9軸センサー情報の取得を終了する。<br>@throws IllegalStateException リスナー未登録|
|void addNineAxisSensorNotificationListener(IHearableNineAxisSensorNotificationListener listener)|9軸センサー情報取得の結果を受信するリスナーを登録する。<br>@param listener 結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void removeNineAxisSensorNotificationListener()|9軸センサー情報取得のリスナーの登録解除を行う。<br>@throws IllegalStateException リスナー未登録|
|void startTemperatureNotification()|温度情報の取得を開始する。<br>@throws IllegalStateException リスナー未登録|
|void stopTemperatureNotification()|温度情報の取得を終了する。<br>@throws IllegalStateException リスナー未登録|
|void addTemperatureNotificationListener(IHearableTemperatureNotificationListener listener)|温度情報取得の結果を受信するリスナーを登録する。<br>@param listener 結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void removeTemperatureNotificationListener()|温度情報取得のリスナーの登録解除を行う。<br>@throws IllegalStateException リスナー未登録|
|void startHeartRateNotification()|脈数情報の取得を開始する。<br>@throws IllegalStateException リスナー未登録|
|void stopHeartRateNotification()|脈数情報の取得を終了する。<br>@throws IllegalStateException リスナー未登録|
|void addHeartRateNotificationListener(IHearableHeartRateNotificationListener listener)|脈数情報取得の結果を受信するリスナーを登録する。<br>@param listener 結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void removeHeartRateNotificationListener()|脈数情報取得のリスナーの登録解除を行う。<br>@throws IllegalStateException リスナー未登録|
|void startPpgNotification()|装着適正度情報の取得を開始する。<br>@throws IllegalStateException リスナー未登録|
|void stopPpgNotification()|装着適正度情報の取得を終了する。<br>@throws IllegalStateException リスナー未登録|
|void addPpgNotificationListener(IHearablePpgNotificationListener listener)|装着適正度情報取得の結果を受信するリスナーを登録する。<br>@param listener 結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void removePpgNotificationListener()|装着適正度情報取得のリスナーの登録解除を行う。<br>@throws IllegalStateException リスナー未登録|
|void registerEaa(UUID uuid)|耳音響認証用の特徴量を取得し登録する。<br>[注意事項]<br>特徴量取得回数は指定した回数以上要求される場合があります。<br>@param uuid 登録するユーザーのuuid<br>@throws IllegalStateException リスナー未登録<br>@throws IllegalArgumentException 不正な入力値<br>@throws RuntimeException 実行時の例外|
|void cancelEaaRegistration()|耳音響認証特徴量登録をキャンセルする。<br>@throws IllegalStateException リスナー未登録|
|void deleteRegistration(UUID uuid)|指定したuuidの耳音響認証の登録を削除する。<br>@param uuid 削除するユーザーのuuid<br>@throws IllegalStateException リスナー未登録<br>@throws IllegalArgumentException 不正な入力値<br>@throws RuntimeException 実行時の例外|
|void deleteRegistration()|すべての耳音響認証の登録を削除する。<br>@throws IllegalStateException リスナー未登録<br>@throws RuntimeException 実行時の例外|
|void verifyEaa()|耳音響認証を照合する。<br>@throws IllegalStateException リスナー未登録<br>@throws RuntimeException 実行時の例外|
|void requestRegisterStatus()|耳音響認証の状態を取得する。<br>@throws IllegalStateException リスナー未登録<br>@throws RuntimeException 実行時の例外|
|void addEaaListener(IHearableEaaListener listener)|耳認証関連機能の実行結果を受信するリスナーを登録する。<br>@param listener 結果を受信するリスナー<br>@throws IllegalArgumentException 不正な入力値|
|void removeEaaListener()|耳認証関連機能のリスナーの登録解除を行う。<br>@throws IllegalArgumentException 不正な入力値|
|void setHearableEaaConfig(HearableEaaConfig config)|耳音響認証設定値を設定する。<br>[注意事項]<br>特徴量取得回数はデフォルトで20回が設定されています。<br>特徴量取得回数が10以下の値を指定した場合は10回が設定されます。<br>@param config 耳音響認証設定値<br>@throws IllegalArgumentException 不正な入力値|
|void setBatteryNotificationInterval(int interval)|バッテリー情報取得周期を設定する。<br>[注意事項]<br>バッテリー情報取得周期デフォルトで300秒が設定されています<br>バッテリー情報取得周期が10秒以下の値を指定した場合は10秒が設定されます。<br>@param interval バッテリー情報取得周期設定値<br>@throws IllegalArgumentException 不正な入力値|

### 引数の説明
#### String macAddress  
00:00:00:00:00:00
#### UUID uuid  
00000000-0000-0000-0000-000000000000  
#### int interval  
300(デフォルト)