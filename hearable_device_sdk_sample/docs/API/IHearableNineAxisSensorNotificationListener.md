# IHearableNineAxisSensorNotifi cationListener
SDKへの9軸センサ情報取得機能要求結果を受信するリスナー
## public interface IHearableNineAxisSensorNotificationListener

### メソッド
* 9軸センサ情報取得開始結果を返す<br>@param resultCode リザルトコード<br>void onStartNotification(int resultCode)
* 9軸センサ情報取得終了結果を返す<br>@param resultCode リザルトコード<br>void onStopNotification(int resultCode)
* 9軸センサ情報取得結果を返す<br>[注意事項]<br>失敗した場合、9軸センサ情報はnullです<br>@param data 9軸センサ情報<br>@param resultCode リザルトコード<br>void onReceiveNotification(byte[] data, int resultCode)

### 引数の説明
byte[] data

|||
|:--|:--|
|1|シーケンス番号|
|2|センシング周期|
|3||
|4||
|5||
|6|ACC X High[0]|
|7|ACC X Low [0]|
|8|ACC Y High[0]|
|9|ACC Y Low [0]|
|10|ACC Z High[0]|
|11|ACC Z Low [0]|
|12|GYR X High[0]|
|13|GYR X Low [0]|
|14|GYR Y High[0]|
|15|GYR Y Low [0]|
|16|GYR Z High[0]|
|17|GYR Z Low [0]|
|18|MAG X High[0]|
|19|MAG X Low [0]|
|20|MAG Y High[0]|
|21|MAG Y Low [0]|
|22|MAG Z High[0]|
|23|MAG Z Low [0]|
|24|センシング周期|
|25|
|26|
|27|
|28|ACC X High[1]|
|29|ACC X Low [1]|
|30|ACC Y High[1]|
|31|ACC Y Low [1]|
|32|ACC Z High[1]|
|33|ACC Z Low [1]|
|34|GYR X High[1]|
|35|GYR X Low [1]|
|36|GYR Y High[1]|
|37|GYR Y Low [1]|
|38|GYR Z High[1]|
|39|GYR Z Low [1]|
|40|MAG X High[1]|
|41|MAG X Low [1]|
|42|MAG Y High[1]|
|43|MAG Y Low [1]|
|44|MAG Z High[1]|
|45|MAG Z Low [1]|
|46|センシング周期|
|47||
|48||
|49||
|50|ACC X High[2]|
|51|ACC X Low [2]|
|52|ACC Y High[2]|
|53|ACC Y Low [2]|
|54|ACC Z High[2]|
|55|ACC Z Low [2]|
|56|GYR X High[2]|
|57|GYR X Low [2]|
|58|GYR Y High[2]|
|59|GYR Y Low [2]|
|60|GYR Z High[2]|
|61|GYR Z Low [2]|
|62|MAG X High[2]|
|63|MAG X Low [2]|
|64|MAG Y High[2]|
|65|MAG Y Low [2]|
|66|MAG Z High[2]|
|67|MAG Z Low [2]|
|68|センシング周期|
|69||
|70||
|71||
|72|ACC X High[3]|
|73|ACC X Low [3]|
|74|ACC Y High[3]|
|75|ACC Y Low [3]|
|76|ACC Z High[3]|
|77|ACC Z Low [3]|
|78|GYR X High[3]|
|79|GYR X Low [3]|
|80|GYR Y High[3]|
|81|GYR Y Low [3]|
|82|GYR Z High[3]|
|83|GYR Z Low [3]|
|84|MAG X High[3]|
|85|MAG X Low [3]|
|86|MAG Y High[3]|
|87|MAG Y Low [3]|
|88|MAG Z High[3]|
|89|MAG Z Low [3]|
|90|センシング周期|
|91||
|92||
|93||
|94|ACC X High[4]|
|95|ACC X Low [4]|
|96|ACC Y High[4]|
|97|ACC Y Low [4]|
|98|ACC Z High[4]|
|99|ACC Z Low [4]|
|100|GYR X High[4]|
|101|GYR X Low [4]|
|102|GYR Y High[4]|
|103|GYR Y Low [4]|
|104|GYR Z High[4]|
|105|GYR Z Low [4]|
|106|MAG X High[4]|
|107|MAG X Low [4]|
|108|MAG Y High[4]|
|109|MAG Y Low [4]|
|110|MAG Z High[4]|
|111|MAG Z Low [4]|

resultCode

### インタフェース仕様
9軸センサの詳細仕様は[こちら](IHearableNineAxisSensorNotificationListenerDetail.md)を参照。