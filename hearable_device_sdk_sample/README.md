# ヒアラブルデバイス(RN002)用サンプルアプリケーション
このアプリはFlutterで開発したヒアラブルデバイス「RN002 TW」の機能確認を行うためのサンプルアプリケーションです。

## サンプルアプリのビルド方法
このビルド方法は、Mac OS上のVScodeを使う前提で説明しています。お使いの環境に合わせて適宜読み替えてください。
1. FinderでFlutterプロジェクトを格納しているフォルダに新規フォルダを作成し、そのフォルダ配下にダウンロードしたhearable_device_sdk_sampleとhearable_device_sdk_sample_pluginフォルダをコピーしてください。
2. hearable_device_sdk_sample_pluginフォルダに、https://hearable-dev.com/index.html からダウンロードしたSDK(Software Development Kit)をコピーしてください。(詳細についてはhearable_device_sdk_sample_pluginにあるREADME.mdを参照してください。)
3. ターミナルを起動し、hearable_device_sdk_sampleフォルダ配下で、flutter pub getを実行してください。
4. スマートフォンとMac(PC)を接続しビルドを実行してください。

## スクリーンショット
![起動画面](/hearable_device_sdk_sample/assets/screen.jpeg)
## ライセンス
本プロジェクトはMITライセンスで提供されています。詳細は[LICENSE](LICENSE)ファイルをご参照ください。
