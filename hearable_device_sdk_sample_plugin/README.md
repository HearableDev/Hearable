# ヒアラブルデバイス(RN002)SDK用プラグインの使い方
このプラグインに https://hearable-dev.com/index.html からダウンロードしたSDK(Software Development Kit)を格納してください。

```
└── hearable_device_sdk_sample_plugin:
    ├── android
    │   ├── libs
    │   │   └── hearable-device-sdk.aar
    ├── ios
    │   ├── framework
    │   │   └── hearable_device_sdk.framework
    │   │       ├── Headers
    │   │       │   ├── EaaEnrollWrapper.h
    │   │       │   ├── HearableCipherWrapper.h
    │   │       │   ├── MultiOutlierDetectionWrapper.h
    │   │       │   ├── hearable_device_sdk-Swift.h
    │   │       │   └── hearable_device_sdk.h
    │   │       ├── Info.plist
    │   │       ├── Modules
    │   │       │   ├── hearable_device_sdk.swiftmodule
    │   │       │   │   ├── Project
    │   │       │   │   │   ├── arm64-apple-ios.swiftsourceinfo
    │   │       │   │   │   └── arm64.swiftso
    │   │       │   │   ├── arm64-apple-ios.swiftdoc
    │   │       │   │   ├── arm64-apple-ios.swiftinterface
    │   │       │   │   ├── arm64-apple-ios.swiftmodule
    │   │       │   │   ├── arm64.swiftdoc
    │   │       │   │   ├── arm64.swiftinterface
    │   │       │   │   └── arm64.swiftmodule
    │   │       │   └── module.modulemap
    │   │       └── hearable_device_sdk
```
　

## ライセンス
本プロジェクトはMITライセンスで提供されています。詳細は[LICENSE](LICENSE)ファイルをご参照ください。
