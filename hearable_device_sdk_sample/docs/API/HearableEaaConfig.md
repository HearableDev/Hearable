# HearableEaaConfig
SDKへの機能要求に対するリザルトコード

## public class HearableEaaConfig

### フィールド
* 特徴量取得回数  
public final int featureRequiredNumber
### コンストラクタ
* 耳音響認証サービスのコンフィグ設定
* 特徴量取得回数はデフォルトで20回が設定されています。
* 特徴量取得回数が10以下の値を指定した場合は10回が設定されます。
* @param featureRequiredNumber 特徴量取得回数  
public HearableEaaConfig(int featureRequiredNumber)
### 引数の説明
featureRequiredNumber
20(デフォルト)