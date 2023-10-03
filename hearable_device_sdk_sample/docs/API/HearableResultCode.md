# HearableResultCode
SDKへの機能要求に対するリザルトコード

## public enum HearableResultCode 列挙型 定数
|発生事象|リザルトコード|
|:--|:--|
|リクエスト成功。|success(0)|
|SDKの処理中に想定外のExceptionが発生。|UNKNOWN(-1)|
|一定時間が経過しても処理が終了しない。|REQUEST_TIMEOUT(-2)|
|受け付け不可の要求。(温度(相対、絶対)が有効中にもう片方のリクエスト)|FAILED_STATUS_UNMATCH(-3)|
|致命的なエラー|FATAL_ERROR(-4)|
|Bluetooth非対応機種。|UNSUPPORTED_BLUETOOTH(-100)|
|Bluetooth機能無効。|BLUETOOTH_DISABLED(-101)|
|Bluetooth権限なし。|BLUETOOTH_PERMISSION_DENIED(-102)|
|スキャン中、切断中、接続中、他処理を実行中。|BLUETOOTH_IS_BUSY(-103)|
|接続対象のデバイスを発見できなかった。|FAILED_FIND_CONNECT_BLE_DEVICE(-104)|
|BLEが既に接続済み。|BLE_IS_ALREADY_CONNECTED(-105)|
|デバイスとのBLE接続要求に失敗。|BLE_CONNECTION_OPERATION_ERROR(-106)|
|デバイスからGATTサービスの情報取得に失敗。|BLE_SERVICE_DISCOVER_ERROR(-107)|
|デバイスがヒアラブルとして必要なGATTサービスを保持していない。|BLE_NOT_FOUND_SERVICE(-108)|
|BLE未接続。|BLE_DISCONNECTED(-109)|
|通知の受信開始、停止に失敗。|BLE_DESCRIPTOR_WRITE_ERROR(-110)|
|キャラクタリスティックの書き込みに失敗。|BLE_CHARACTERISTIC_WRITE_ERROR(-111)|
|キャラクタリスティックの読み込みに失敗。|BLE_CHARACTERISTIC_READ_ERROR(-112)|
|特徴量取得不足。|NOT_SUFFICIENT_FEATURE_COLLECT(-200)|
| 耳音響認証の他処理実行中。|EAA_IS_BUSY(-201)|
|特徴量取得失敗。|FAILED_FEATURE_COLLECT(-202)|
|耳音響認証のパラメータ登録失敗。|FAILED_REGISTER_PARAMETERS(-203)|
|耳音響認証の登録削除失敗。|FAILED_DELETE_REGISTRATION(-204)|
|耳音響認証の照合に失敗。|FAILED_MATCHING_OF_EAA(-205)|
|耳音響認証の登録状態取得に失敗。|FAILED_GET_REGISTRATION_STATUS(-206)|
|データ異常。|UNEXPECTED_DATA(-300)|
### メソッド
リザルトコードを取得。  
@return リザルトコード  
public int getInt()