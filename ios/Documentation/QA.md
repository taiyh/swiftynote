###  Xcode 16 默认使用folder而不是group组织文件
> [XCode 16 beta 3 为所有项目初始内容创建一个文件夹而不是一个组](https://developer.apple.com/forums/thread/759620?answerId=795641022#795641022)


###  Swift 版本与目标部署版本
> [Swift 版本兼容性](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/compatibility)

### App启动流程
> [app launch, prewarm](https://developer.apple.com/documentation/uikit/responding-to-the-launch-of-your-app?language=objc)
> [restoration](https://developer.apple.com/documentation/uikit/restoring-your-app-s-state?language=objc)


### App沙盒文件目录及推荐用途
>[Install files in the proper locations](https://developer.apple.com/documentation/uikit/performing-one-time-setup-for-your-app?language=objc)
- 应始终将应用专用文件放在~/Library子目录中。
- `~/Library/Application Support/`— 存储您希望与用户的其他内容一起备份的应用特定文件。（您可以根据需要在此处创建自定义子目录。）
- `~/Library/Caches/`— 存储可以轻松重新生成或下载的临时数据文件
- 所有临时文件放在应用目录中.
```
let appSupportURL = FileManager.default.urls(for: 
      .applicationSupportDirectory, in: .userDomainMask)


let cachesURL = FileManager.default.urls(for: 
      .cachesDirectory, in: .userDomainMask)
      
let tempURL = FileManager.default.temporaryDirectory

```

### iOS13 UIWindowScene
iOS13开始将UI相关的生命周期回调从UIApplicationDelegate，移到到了UIWindowSceneDelegate。同时通知也有相应改变 willEnterForegroundNotification
You can support both types of delegate objects, but UIKit always uses scene delegate objects when they’re available

多窗口适用于iPad，不适用于iPhone


### 设置或设备条件发生变化时的系统通知
>[处理排队的通知](https://developer.apple.com/documentation/uikit/processing-queued-notifications)

| 通知                           | 通知                                                         |      |
| ------------------------------ | ------------------------------------------------------------ | ---- |
| 用户更改了应用的偏好设置       | [`didChangeNotification`](https://developer.apple.com/documentation/foundation/userdefaults/1408206-didchangenotification) |      |
| 当前语言或区域设置已更改       | [`currentLocaleDidChangeNotification`](https://developer.apple.com/documentation/foundation/nslocale/1418141-currentlocaledidchangenotificati) |      |
| 显示器的屏幕模式改变           | [`modeDidChangeNotification`](https://developer.apple.com/documentation/uikit/uiscreen/modedidchangenotification) |      |
| 外接显示器已连接或断开         | [`didConnectNotification`](https://developer.apple.com/documentation/uikit/uiscreen/didconnectnotification)<br/>[`didDisconnectNotification`](https://developer.apple.com/documentation/uikit/uiscreen/diddisconnectnotification) |      |
| 配件已连接或断开               | [`EAAccessoryDidConnect`](https://developer.apple.com/documentation/foundation/nsnotification/name/1613827-eaaccessorydidconnect)<br/>[`EAAccessoryDidDisconnect`](https://developer.apple.com/documentation/foundation/nsnotification/name/1613901-eaaccessorydiddisconnect) |      |
| 用户的 iCloud 帐户状态发生变化 | [`NSUbiquityIdentityDidChange`](https://developer.apple.com/documentation/foundation/nsnotification/name/1407629-nsubiquityidentitydidchange) |      |
| 设备方向已改变                 | [`orientationDidChangeNotification`](https://developer.apple.com/documentation/uikit/uidevice/orientationdidchangenotification) |      |
| 时间发生了重大变化             | [`significantTimeChangeNotification`](https://developer.apple.com/documentation/uikit/uiapplication/significanttimechangenotification) |      |
| 电池电量或电池状态发生变化     | [`batteryLevelDidChangeNotification`](https://developer.apple.com/documentation/uikit/uidevice/batteryleveldidchangenotification)<br/>[`batteryStateDidChangeNotification`](https://developer.apple.com/documentation/uikit/uidevice/batterystatedidchangenotification) |      |
| 设备与用户的距离发生了变化     | [`proximityStateDidChangeNotification`](https://developer.apple.com/documentation/uikit/uidevice/proximitystatedidchangenotification) |      |


### 安装 flipper 问题记录

1，安装 `idb` companion

```
brew tap facebook/fb
arch -arm64 brew install idb-companion
```

2，安装 `idb` client

安装 pip

```
curl https://bootstrap.pypa.io/get-pip.py | python3
```

```
pip install fb-idb
```

>[idb](https://github.com/facebook/flipper/issues/3126)

```
which idb
```

>[M1 idb_companion](https://github.com/facebook/flipper/issues/3497)

```
sudo  ln -s /opt/homebrew/bin/idb_companion /usr/local/bin/idb_companion
```

### idb 基本使用
```
idb list-targets
```
```
idb list-apps --udid 74064851-4B98-473A-8110-225202BB86F6
```
```
idb launch com.apple.mobilesafari
```


### RN调试工具 reactotron
>[doc]https://docs.infinite.red/reactotron/quick-start/react-native/
>[github](https://github.com/infinitered/reactotron)

### RN内置调试工具 devtools
>[devtools](https://reactnative.dev/docs/next/react-native-devtools)

### swift 条件编译函数targetEnvironment
simulator：检查是否在模拟器环境中编译。
macCatalyst：检查是否在 macOS 环境中编译（使用 Mac Catalyst）。
