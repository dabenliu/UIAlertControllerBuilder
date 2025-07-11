//
//  UIAlertControllerBuilder.h
//  Demo
//
//  Created by 大笨刘 on 2025/7/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^UIAlertControllerBuilderActionBlock)(UIAlertAction *action, UIAlertController *alert);

@interface UIAlertControllerBuilder : NSObject <UIAdaptivePresentationControllerDelegate, UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) UIAlertController *alertController;

// 链式API
- (UIAlertControllerBuilder *(^)(NSString *title))title;
- (UIAlertControllerBuilder *(^)(NSString *message))message;
- (UIAlertControllerBuilder *(^)(NSString *title, UIAlertActionStyle style, UIColor * _Nullable color, UIAlertControllerBuilderActionBlock _Nullable block))addAction;
- (UIAlertControllerBuilder *(^)(UIViewController *presentVC))presentIn;
// 新增：设置标题颜色
- (UIAlertControllerBuilder *(^)(UIColor *color))titleColor;
// 新增：设置内容颜色
- (UIAlertControllerBuilder *(^)(UIColor *color))messageColor;
// 新增：添加输入框
- (UIAlertControllerBuilder *(^)(void(^config)(UITextField *textField)))addTextField;
// 新增：present 时带 completion
- (UIAlertControllerBuilder *(^)(UIViewController *presentVC, void(^completion)(void)))presentInWithCompletion;
// 新增：popover 配置（iPad）
- (UIAlertControllerBuilder *(^)(void(^config)(UIPopoverPresentationController *popover)))popoverConfig;
// 设置富文本标题
- (UIAlertControllerBuilder *(^)(NSAttributedString *attrTitle))attributedTitle;
// 设置富文本内容
- (UIAlertControllerBuilder *(^)(NSAttributedString *attrMessage))attributedMessage;

@end

UIAlertControllerBuilder *AlertBuilder(UIAlertControllerStyle style);

NS_ASSUME_NONNULL_END
