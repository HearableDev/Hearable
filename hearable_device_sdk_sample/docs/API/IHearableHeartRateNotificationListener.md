# IHearableHeartRateNotifi cationListener
SDKへの脈数情報取得機能要求結果を受信するリスナー

## public interface IHearableHeartRateNotificationListener

### メソッド
* 脈数情報取得開始結果を返す<br>@param resultCode リザルトコード<br>void onStartNotification(int resultCode)
* 脈数情報取得終了結果を返す<br>* @param resultCode リザルトコード<br>void onStopNotification(int resultCode)
* 脈数情報取得結果を返す<br>[注意事項]<br>失敗した場合、脈数情報はnullです<br>@param data 脈数情報<br>@param resultCode リザルトコード<br>
void onReceiveNotification(byte[] data, int resultCode)

### 引数の説明
byte[] data
|||
|:--|:--|
|Data[0]|Heart Rate Value|
|Data[1:2]|RR Interval 0|
|...||
||RR Interval N|

※符号付16bit、8bit単位のLittle-Endian  
resultCode