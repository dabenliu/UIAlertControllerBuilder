# UIAlertControllerBuilder

[![Version](https://img.shields.io/cocoapods/v/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)
[![License](https://img.shields.io/cocoapods/l/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)
[![Platform](https://img.shields.io/cocoapods/p/UIAlertControllerBuilder.svg?style=flat)](https://cocoapods.org/pods/UIAlertControllerBuilder)

`UIAlertControllerBuilder` 是一个用于 iOS 的 Objective-C 链式封装库，旨在帮助开发者更优雅地构建 `UIAlertController` 弹窗。它支持 Alert/ActionSheet 两种样式，提供颜色自定义、文本输入、自定义按钮及 iPad Popover 适配等功能，让弹窗构建代码更简洁易读。  
`UIAlertControllerBuilder` is an Objective-C chainable wrapper library for iOS, designed to help developers build `UIAlertController` popups more elegantly. It supports both Alert and ActionSheet styles, offering features like color customization, text input, custom buttons, and iPad Popover adaptation, making popup construction code cleaner and more readable.

---

## 🧩 特性 Features

- ✅ 链式设置标题/消息：`title(@"标题").message(@"内容")`  
  ✅ Chainable title/message setting: `title(@"Title").message(@"Message")`
- ✅ 添加按钮及点击回调：`addAction(@"确认", style, color, block)`  
  ✅ Add buttons with click callbacks: `addAction(@"Confirm", style, color, block)`
- ✅ 自定义文字颜色：`titleColor(...)`、`messageColor(...)`  
  ✅ Customize text colors: `titleColor(...)`, `messageColor(...)`
- ✅ 支持富文本标题和内容：`attributedTitle(...)`、`attributedMessage(...)`  
  ✅ Support attributed (rich) text for title and message
- ✅ 兼容两种弹窗样式：`UIAlertControllerStyleAlert` 和 `ActionSheet`  
  ✅ Compatible with both Alert and ActionSheet styles
- ✅ 支持 Alert 输入框：`addTextField(...)`  
  ✅ Supports adding text fields in Alert style
- ✅ 适配 iPad Popover：`popoverConfig(...)`  
  ✅ Adapt to iPad Popover with `popoverConfig(...)`
- ✅ 便捷展示方法：`presentIn` / `presentInWithCompletion`  
  ✅ Convenient presentation methods: `presentIn` and `presentInWithCompletion`

---

## 🚀 安装 Installation

UIAlertControllerBuilder 支持通过 CocoaPods 集成：  
UIAlertControllerBuilder supports integration via CocoaPods:

```ruby
pod 'UIAlertControllerBuilder'
```

---

## 📝 示例用法 Example Usage

以下是使用 `UIAlertControllerBuilder` 构建不同类型弹窗的示例：  
The following examples show how to build various types of alerts using `UIAlertControllerBuilder`.

### 1. 基础 Alert 弹窗 Basic Alert

```objective-c
#import <UIAlertControllerBuilder/UIAlertControllerBuilder.h>

AlertBuilder(UIAlertControllerStyleAlert)
    .title(@"提示") // title
    .message(@"点击下面按钮可以打印日志。") // message
    .addAction(@"取消", UIAlertActionStyleCancel, nil, ^(UIAlertAction *action, UIAlertController *alert) {
        NSLog(@"取消按钮被点击"); // Cancel tapped
    })
    .addAction(@"确定", UIAlertActionStyleDefault, [UIColor blueColor], ^(UIAlertAction *action, UIAlertController *alert) {
        NSLog(@"确定按钮被点击"); // Confirm tapped
    })
    .presentIn(self);
```

#### 📸 弹窗效果 Screenshot

<img src="https://github.com/dabenliu/UIAlertControllerBuilder/blob/main/alert.png" alt="UIAlertControllerBuilder 示例效果" width="400"/>

---

### 2. 带输入框的 Alert 弹窗 Alert with Input

```objective-c
AlertBuilder(UIAlertControllerStyleAlert)
    .title(@"输入信息")
    .message(@"请输入您的姓名")
    .addTextField(^(UITextField *textField) {
        textField.placeholder = @"请输入姓名";
        textField.borderStyle = UITextBorderStyleRoundedRect;
    })
    .addAction(@"提交", UIAlertActionStyleDefault, nil, ^(UIAlertAction *action, UIAlertController *alert) {
        UITextField *textField = alert.textFields.firstObject;
        NSLog(@"输入的内容：%@", textField.text);
    })
    .addAction(@"取消", UIAlertActionStyleCancel, nil, nil)
    .presentIn(self);
```

---

### 3. ActionSheet 样式弹窗 ActionSheet Style

```objective-c
AlertBuilder(UIAlertControllerStyleActionSheet)
    .title(@"选择操作")
    .message(@"请选择需要执行的操作")
    .addAction(@"拍照", UIAlertActionStyleDefault, nil, ^(UIAlertAction *action, UIAlertController *alert) {
        NSLog(@"拍照操作");
    })
    .addAction(@"从相册选择", UIAlertActionStyleDefault, nil, ^(UIAlertAction *action, UIAlertController *alert) {
        NSLog(@"从相册选择");
    })
    .addAction(@"取消", UIAlertActionStyleCancel, nil, nil)
    .presentIn(self);
```

---

## 🔖 许可证 License

UIAlertControllerBuilder 基于 MIT 许可证开源。  
UIAlertControllerBuilder is open-sourced under the MIT license.  

查看 LICENSE 文件了解详细信息：  
See the [LICENSE](https://github.com/dabenliu/UIAlertControllerBuilder/blob/main/LICENSE) file for details.
