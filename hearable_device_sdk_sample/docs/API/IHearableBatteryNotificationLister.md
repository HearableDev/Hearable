# IHearableBatteryNotificationListener
SDKへのバッテリー情報取得機能要求結果を受信するリスナー
## public interface IHearableBatteryNotificationListener

### メソッド
* バッテリー情報取得開始結果を返す<br>@param resultCode リザルトコード<br>void onStartNotification(int resultCode)
/**
* バッテリー情報取得終了結果を返す<br>@param resultCode リザルトコード<br>void onStopNotification(int resultCode)
* バッテリー情報取得結果を返す<br>[注意事項]<br>失敗した場合、バッテリー情報はnullです<br>@param data バッテリー情報<br>@param resultCode リザルトコード<br>void onReceiveNotification(byte[] data, int resultCode)

### 引数の説明
byte[] data

|||
|:--|:--|
|0|Battery残量(%) L 例 0x54|
|1|Battery残量(%) H 例 0x00|
|2|Battery残量(mV) L 例 0x64|
|3|Battery残量(mV) H 例 0x0F|

例  90% (0x0054)  
例  3940mV (0x0F64)  
resultCode