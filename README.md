# UIAlertControllerBuilder

[![CI Status](https://img.shields.io/travis/dabenliu/UIAlertControllerBuilder.svg?style=flat)](https://travis-ci.org/dabenliu/UIAlertControllerBuilder)
[![Version](https://img.shields.io/cocoapods/v/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)
[![License](https://img.shields.io/cocoapods/l/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)
[![Platform](https://img.shields.io/cocoapods/p/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)

`UIAlertControllerBuilder` 是一个用于 iOS 的 Objective-C 链式封装库，用于优雅地构建 `UIAlertController` 弹窗。支持 Alert / ActionSheet、颜色设置、文本输入、自定义按钮、iPad Popover 等。

---

## 🧩 特性 Features

- ✅ 链式设置标题/消息：`title(@"标题").message(@"内容")`
- ✅ 添加按钮及点击回调：`addAction(@"确认", style, color, block)`
- ✅ 设置文字颜色：`titleColor(...)`、`messageColor(...)`
- ✅ 设置富文本标题和内容：`attributedTitle(...)`、`attributedMessage(...)`
- ✅ 支持 `UIAlertControllerStyleAlert` 和 `ActionSheet`
- ✅ 支持 Alert 输入框：`addTextField(...)`
- ✅ 支持 iPad Popover：`popoverConfig(...)`
- ✅ 支持 presentIn / presentInWithCompletion

---

## 🚀 安装 Installation

UIAlertControllerBuilder 支持通过 CocoaPods 集成：

```ruby
pod 'UIAlertControllerBuilder'
