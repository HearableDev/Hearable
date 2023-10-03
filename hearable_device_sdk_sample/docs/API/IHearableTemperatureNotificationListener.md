# IHearableTemperatureNotifi cationListener
SDKへの温度情報取得機能要求結果を受信するリスナー

## public interface IHearableTemperatureNotificationListener
### メソッド
* 温度情報取得開始結果を返す<br>@param resultCode リザルトコード<br>void onStartNotification(int resultCode)
* 温度情報取得終了結果を返す<br>@param resultCode リザルトコード<br>void onStopNotification(int resultCode)
* 温度情報取得結果を返す<br>[注意事項]<br>失敗した場合、温度情報はnullです<br>@param data 温度情報<br>@param resultCode リザルトコード<br>void onReceiveNotification(byte[] data, int resultCode)

### 引数の説明
byte[] data

|||
|:--|:--|
|Data[0]|Tb(L)|
|Data[1]|Tb(H)|
|Data[2]|K(L)|
|Data[3]|K(H)|
|Data[4]|Ti(L)|
|Data[5]|Ti(H)|
|Data[6]|To(L)|
|Data[7]|To(H)|

resultCode