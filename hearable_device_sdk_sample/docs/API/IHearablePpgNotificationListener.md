# IHearablePpgNotifi cationListener
SDKへの装着適正度情報取得機能要求結果を受信するリスナー

## public interface IHearablePpgNotificationListener

### メソッド
* 装着適正度情報取得開始結果を返す<br>@param resultCode リザルトコード<br>void onStartNotification(int resultCode)
* 装着適正度情報取得終了結果を返す<br>@param resultCode リザルトコード<br>void onStopNotification(int resultCode)
* 装着適正度情報取得結果を返す<br>[注意事項]<br>失敗した場合、装着適正度情報はnullです<br>@param data 装着適正度情報<br>@param resultCode リザルトコード<br>void onReceiveNotification(byte[] data, int resultCode)

### 引数の説明
byte[] data
|||
|:--|:--|
|Data[0:1]|Earbud Fitting Score (0 – 100)|
|Data[2:3]|Raw audio data 0|
|Data[4:5]|Raw audio data 1|
|...||
||Raw audio data N-1|
|...||
||Raw audio data N-3|

※符号付16bit、8bit単位のLittle-Endian  
resultCode