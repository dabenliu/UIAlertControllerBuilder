# UIAlertControllerBuilder

[![CI Status](https://img.shields.io/travis/dabenliu/UIAlertControllerBuilder.svg?style=flat)](https://travis-ci.org/dabenliu/UIAlertControllerBuilder)
[![Version](https://img.shields.io/cocoapods/v/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)
[![License](https://img.shields.io/cocoapods/l/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)
[![Platform](https://img.shields.io/cocoapods/p/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)

`UIAlertControllerBuilder` 是一个用于 iOS 的 Objective-C 链式封装库，用于优雅地构建 `UIAlertController` 弹窗。支持 Alert / ActionSheet、颜色设置、文本输入、自定义按钮、iPad Popover 等。  
`UIAlertControllerBuilder` is an Objective-C chainable wrapper library for iOS to elegantly build `UIAlertController`. Supports Alert/ActionSheet, color customization, text input, custom buttons, iPad Popover, and more.

---

## 🧩 特性 Features

- ✅ 链式设置标题/消息：`title(@"标题").message(@"内容")`  
  Chainable title/message setting: `title(@"Title").message(@"Message")`
- ✅ 添加按钮及点击回调：`addAction(@"确认", style, color, block)`  
  Add buttons with click callbacks: `addAction(@"Confirm", style, color, block)`
- ✅ 设置文字颜色：`titleColor(...)`、`messageColor(...)`  
  Customize text colors: `titleColor(...)`, `messageColor(...)`
- ✅ 设置富文本标题和内容：`attributedTitle(...)`、`attributedMessage(...)`  
  Support attributed (rich) text for title and message
- ✅ 支持 `UIAlertControllerStyleAlert` 和 `ActionSheet`  
  Supports both Alert and ActionSheet styles
- ✅ 支持 Alert 输入框：`addTextField(...)`  
  Supports adding text fields in Alert style
- ✅ 支持 iPad Popover：`popoverConfig(...)`  
  Support iPad Popover configuration
- ✅ 支持 presentIn / presentInWithCompletion  
  Supports `presentIn` and `presentInWithCompletion` methods

---

## 🚀 安装 Installation

UIAlertControllerBuilder 支持通过 CocoaPods 集成：  
UIAlertControllerBuilder supports integration via CocoaPods:

```ruby
pod 'UIAlertControllerBuilder'
