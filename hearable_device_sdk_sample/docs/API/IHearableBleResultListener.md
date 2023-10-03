# IHearableBleResultListener
SDKへのBLE機能要求結果を受信するリスナー
## public interface IHearableBleResultListener

### メソッド
* ヒアラブルデバイス接続結果を返す<br>@param resultCode リザルトコード<br>void onConnect(int resultCode)
* ヒアラブルデバイス切断結果を返す<br>@param resultCode リザルトコード<br>void onDisconnect(int resultCode)<br>
* ヒアラブルデバイススキャン結果を返す<br>[注意事項]<br>スキャンに失敗した場合、デバイスリストはnullです<br>@param deviceList デバイスリスト<br>
@param resultCode リザルトコード<br>void onScanResult(List<IHearableDeviceInfo> deviceList, int resultCode)<br>

### 引数の説明
List<IHearableDeviceInfo> deviceList<br>
resultCode