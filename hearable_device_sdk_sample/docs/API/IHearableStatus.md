# IHearableStatus
ヒアラブルサービス状態のインターフェース
## public interface IHearableStatus

### メソッド
* ヒアラブルデバイスとBLEの接続状態を返す<br>@return true:接続, false:切断<br>boolean isBluetoothLEConnected()
* BLEで接続されているヒアラブルデバイスのデバイス名を返す<br>@return デバイス名<br>String getBleConnectDeviceName()