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
