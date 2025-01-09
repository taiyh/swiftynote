#  通过SwiftPM添加SwiftLint

1,PROJECT页，Package Dependencies 页签添加 `https://github.com/SimplyDanny/SwiftLintPlugins`
2,TARGETS页，`Build Phases` 页签的 `Run Build Tool Plug-ins` 添加 `SwiftLintBuildToolPlugin`
3,Xcode15以上，build setting `ENABLE_USER_SCRIPT_SANDBOXING` 设为 `NO`

>[SwiftLint](https://github.com/realm/SwiftLint)
>[Kodeco Swift Style Guide](https://github.com/kodecocodes/swift-style-guide)

