# アプリケーション開発用SDK API仕様書
## はじめに
このAPI仕様書はヒアラブルデバイス「RN002 TW」の向けに作られたものです。
スマートフォン(Android/iOS)とヒアラブルデバイスを接続するアプリケーション開発を行う場合に参照してください。  
Bluetooth Low Energyを、以降BLEと表記しています。

商標  
・Android は Google LLC の商標です。  
・iOSは、Apple Inc.のOS名称です。IOSは、Cisco Systems, Inc. またはその関連会社の米国およびその他の国における  登録商標または商標であり、Apple Inc.がライセンスに基づき使用しています。  
・Bluetooth 及び Bluetooth Low Energy は、米国 Bluetooth SIG, INC.の米国ならびにその他の国における商標または登録商標です。

## クラス定義
| Android | iOS | 説明 |
| :-- | :--| :-- |
| Classes | Classes | |
|[public class HearableService](HearableService.md)| [public class HearableService: NSObject](HearableService.md)|ヒアラブルサービスのファクトリークラス|
|[public class HearableEaaConfig](HearableEaaConfig.md)|[public class HearableEaaConfig: NSObject](HearableEaaConfig.md)|耳音響認証のコンフィグ|
|Enumerations|Enumerations||
|[public enum HearableResultCode](HearableResultCode.md)|[@objc public enum HearableResultCode: Int](HearableResultCode.md)|SDKへの機能要求に対するリザルトコード|
|Interfaces|Protocols||
|[public interface IHearableService](IHearableService.md)|[@objc public protocol IHearableService: AnyObject](IHearableService.md)|ヒアラブルサービス<br>*ヒアラブルデバイスを検索する。<br>*指定したMACアドレスを保持するヒアラブルデバイスとのBLE接続をする。<br>*現在BluetoothClassic接続しているヒアラブルデバイスとBLE接続をする。<br>*ヒアラブルデバイスとのBLE切断をする。<br>*デバイス接続状況の通知を受信するリスナーを登録する。<br>*BLE接続関連機能の実行結果を受信するリスナーを登録する。 <br>*デバイス接続状況の通知を受信するリスナーを解除する。 <br>*BLE接続関連機能のリスナーの登録解除を行う。<br> *バッテリー情報の取得を開始する。<br>*バッテリー情報の取得を終了する。<br>*バッテリー情報取得の結果を受信するリスナーを登録する。<br>*バッテリー情報取得のリスナーの登録解除を行う。<br>*9軸センサー情報の取得を開始する。<br>*9軸センサー情報の取得を終了する。<br>*9軸センサー情報取得の結果を受信するリスナーを登録する。<br>*9軸センサー情報取得のリスナーの登録解除を行う。<br>*温度情報の取得を開始する。<br>*温度情報の取得を終了する。<br>*温度情報取得の結果を受信するリスナーを登録する。<br>*温度情報取得のリスナーの登録解除を行う。<br>*脈数情報の取得を開始する。<br>*脈数情報の取得を終了する。<br>*脈数情報取得の結果を受信するリスナーを登録する。<br>*脈数情報取得のリスナーの登録解除を行う。|
|[public interface IHearableDeviceInfo](IHearableDeviceInfo.md)|[@objc public protocol HearableDeviceInfo: AnyObject](IHerableDeviceInfo.md)|ヒアラブルデバイス情報*ヒアラブルデバイスのMACアドレスを返す<br>*ヒアラブルデバイスのデバイス名を返す<br>*ヒアラブルデバイスのRSSIを返す|
|[public interface IHearableBleResultListener](IHearableBleResultListener.md)|[@objc public protocol IHearableBleResultListener: AnyObject](IHearableBleResultListener.md)|SDKへのBLE機能要求結果を受信するリスナー<br>*ヒアラブルデバイス接続結果を返す<br>*ヒアラブルデバイス切断結果を返す<br>*ヒアラブルデバイススキャン結果を返す|
|[public interface IHearableStatus](IHearableStatus.md)|[@objc public protocol HearableStatus: AnyObject](IHearableStatus.md)|ヒアラブルサービス状態のインターフェース<br>*ヒアラブルデバイスとBLEの接続状態を返す<br>*BLEで接続されているヒアラブルデバイスのデバイス名を返す|
|[public interface IHearableStatusListener](IHearableStatusListener.md)|[@objc public protocol IHearableStatusListener: AnyObject](IHearableStatusListener.md)|ヒアラブルサービスから状態通知を受信するリスナー<br>*ヒアラブルサービスから状態変更通知を受信した際に呼ばれる|
|[public interface IHearableNineAxisSensorNotificationListener](IHearableNineAxisSensorNotificationListener.md)|[@objc public protocol IHearableNineAxisSensorNotificationListener: AnyObject](IHearableNineAxisSensorNotificationListener.md)|SDKへの9軸センサ情報取得機能要求結果を受信するリスナー<br>*9軸センサ情報取得開始結果を返す<br>*9軸センサ情報取得終了結果を返す<br>*9軸センサ情報取得結果を返す|
|[public interface IHearableTemperatureNotificationListener](IHearableTemperatureNotificationListener.md)|[@objc public protocol IHearableTemperatureNotificationListener: AnyObject](IHearableTemperatureNotificationListener.md)|SDKへの温度情報取得機能要求結果を受信するリスナー<br>*温度情報取得開始結果を返す<br>*温度情報取得終了結果を返す<br>*温度情報取得結果を返す|
|[public interface IHearableHeartRateNotificationListener](IHearableHeartRateNotificationListener.md)|[@objc public protocol IHearableHeartRateNotificationListener: AnyObject](IHearableHeartRateNotificationListener.md)|SDKへの脈数情報取得機能要求結果を受信するリスナー<br>*脈数情報取得開始結果を返す<br>*脈数情報取得終了結果を返す<br>*脈数情報取得結果を返す|
|[public interface IHearablePpgNotificationListener](IHearablePpgNotificationListener.md)|[@objc public protocol IHearablePpgNotificationListener: AnyObject](IHearablePpgNotificationListener.md)|SDKへの装着適正度情報取得機能要求結果を受信するリスナー<br>*装着適正度情報取得終了結果を返す<br>*装着適正度情報取得結果を返す|
|[public interface IHearableEaaListener](IHearableEaaListener.md)|[@objc public protocol IHearableEaaListener: AnyObject](IHearableEaaListener.md)|SDKへの耳音響認証機能要求結果を受信するリスナー<br>*耳音響認証登録結果を返す<br>*耳音響認証登録キャンセル結果を返す<br>*耳音響認証登録削除結果を返す<br>*耳音響認証照合結果を返す<br>*耳音響認証状態取得結果を返す|
|[public interface IHearableBatteryNotificationListener](IHearableBatteryNotificationLister.md)|[@objc public protocol IHearableBatteryNotificationListener: AnyObject](IHearableBatteryNotificationLister.md)|SDKへのバッテリー情報取得機能要求結果を受信するリスナー<br>*バッテリー情報取得開始結果を返す<br>*バッテリー情報取得終了結果を返す<br>*バッテリー情報取得結果を返す|
