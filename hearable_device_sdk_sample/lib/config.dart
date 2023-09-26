class Config {
  int featureRequiredNumber = 20;
  int batteryNotificationInterval = 300;

  static final Config _instance = Config._internal();

  factory Config() {
    return _instance;
  }

  Config._internal() {
    // アプリにデータを保存する場合はここで読み込み
  }
}
