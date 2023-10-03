# IHearableEaaListener
SDKへの耳音響認証機能要求結果を受信するリスナー

## public interface IHearableEaaListener

### メソッド
* 耳音響認証登録結果を返す<br>@param resultCode リザルトコード<br>void onRegister(int resultCode)
* 耳音響認証登録キャンセル結果を返す<br>@param resultCode リザルトコード<br>void onCancelRegistration(int resultCode)
* 耳音響認証登録削除結果を返す<br>@param resultCode リザルトコード<br>void onDeleteRegistration(int resultCode)
* 耳音響認証照合結果を返す<br>@param score 最高スコア<br>@param uuid 最高スコアのUUID<br>@param resultCode リザルトコード<br>void onVerify(Float score, UUID uuid, int resultCode)
* 耳音響認証状態取得結果を返す<br>@param uuids 登録されているユーザーUUID<br>@param resultCode リザルトコード<br>void onGetRegistrationStatus(UUID[] uuids, int resultCode)

### 引数の説明
Float score,  
例 -1023.96875~0  
UUID uuid  
例 00000000-0000-0000-0000-000000000000  
UUID[] uuids  
例 [00000000-0000-0000-0000-000000000000, 11111111-1111-1111-1111-111111111111]