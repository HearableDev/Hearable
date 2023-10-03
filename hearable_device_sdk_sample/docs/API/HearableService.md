# HearableService
ヒアラブルサービスのファクトリークラス

## public class HearableService extend java.lang.Object

### コンストラクタ
public HearableService()
### メソッド
* ヒアラブルサービスの起動を行い、IHearableServiceインスタンスを返す。 * [注意事項]
* ContextにはアプリのActivityを指定すること。
* @param context Context
* @return IHearableService インスタンス
* @throws IllegalArgumentException 不正な入力値
public static IHearableService startService(@NonNull Context context)
### 引数の説明
@NonNull Context context