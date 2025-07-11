//
//  UIAlertControllerBuilder.m
//  Demo
//
//  Created by 大笨刘 on 2025/7/10.
//

#import "UIAlertControllerBuilder.h"
#import <UIKit/UIKit.h>

@implementation UIAlertControllerBuilder

UIAlertControllerBuilder *AlertBuilder(UIAlertControllerStyle style) {
    UIAlertControllerBuilder *builder = [[UIAlertControllerBuilder alloc] initWithStyle:style];
    return builder;
}

// 内存管理：保存强引用，弹窗消失后自动释放
static NSMutableArray *g_alertParamStrongRefs;

- (void)retainSelf {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_alertParamStrongRefs = [NSMutableArray array];
    });
    @synchronized (g_alertParamStrongRefs) {
        [g_alertParamStrongRefs addObject:self];
    }
}

- (void)releaseSelf {
    @synchronized (g_alertParamStrongRefs) {
        [g_alertParamStrongRefs removeObject:self];
    }
}

- (void)dealloc {
    NSLog(@"UIAlertControllerBuilder 已释放");
}

- (instancetype)init {
    if (self = [super init]) {
        _alertController = nil; // 不初始化
    }
    return self;
}

- (instancetype)initWithStyle:(UIAlertControllerStyle)style {
    if (self = [super init]) {
        _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:style];
    }
    return self;
}

- (UIAlertControllerBuilder *(^)(NSString *title))title {
    return ^UIAlertControllerBuilder *(NSString *title) {
        self.alertController.title = title;
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(NSString *message))message {
    return ^UIAlertControllerBuilder *(NSString *message) {
        self.alertController.message = message;
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(NSString *title, UIAlertActionStyle style, UIColor * _Nullable color, UIAlertControllerBuilderActionBlock block))addAction {
    return ^UIAlertControllerBuilder *(NSString *title, UIAlertActionStyle style, UIColor *color, UIAlertControllerBuilderActionBlock block) {
        __weak typeof(self) weakSelf = self;
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction *action) {
            if (block) block(action, weakSelf.alertController);
            [weakSelf releaseSelf];
        }];
        if (color) {
            [action setValue:color forKey:@"titleTextColor"];
        }
        [self.alertController addAction:action];
        return self;
    };
}

#pragma mark - UIAdaptivePresentationControllerDelegate
- (void)presentationControllerDidDismiss:(UIPresentationController *)presentationController {
    [self releaseSelf];
}

- (UIAlertControllerBuilder *(^)(UIViewController *presentVC))presentIn {
    return ^UIAlertControllerBuilder *(UIViewController *presentVC) {
        [self retainSelf];
        
        UIAlertControllerStyle style = self.alertController.preferredStyle;
        if (style == UIAlertControllerStyleActionSheet &&
            [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.alertController.popoverPresentationController.delegate = self;
        }
        
        [presentVC presentViewController:self.alertController animated:YES completion:nil];
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(UIViewController *presentVC, void(^completion)(void)))presentInWithCompletion {
    return ^UIAlertControllerBuilder *(UIViewController *presentVC, void(^completion)(void)) {
        [self retainSelf];
        
        UIAlertControllerStyle style = self.alertController.preferredStyle;
        if (style == UIAlertControllerStyleActionSheet &&
            [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.alertController.popoverPresentationController.delegate = self;
        }
        
        [presentVC presentViewController:self.alertController animated:YES completion:completion];
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(UIColor *color))titleColor {
    return ^UIAlertControllerBuilder *(UIColor *color) {
        if (self.alertController.title) {
            NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:self.alertController.title attributes:@{NSForegroundColorAttributeName: color}];
            [self.alertController setValue:attrTitle forKey:@"attributedTitle"];
        }
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(UIColor *color))messageColor {
    return ^UIAlertControllerBuilder *(UIColor *color) {
        if (self.alertController.message) {
            NSMutableAttributedString *attrMsg = [[NSMutableAttributedString alloc] initWithString:self.alertController.message attributes:@{NSForegroundColorAttributeName: color}];
            [self.alertController setValue:attrMsg forKey:@"attributedMessage"];
        }
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(void(^config)(UITextField *textField)))addTextField {
    return ^UIAlertControllerBuilder *(void(^config)(UITextField *textField)) {
        if (self.alertController.preferredStyle == UIAlertControllerStyleAlert) {
            [self.alertController addTextFieldWithConfigurationHandler:config];
        } else {
            NSLog(@"[UIAlertControllerBuilder] 只有 UIAlertControllerStyleAlert 支持输入框，当前为 ActionSheet，addTextField 已被忽略。");
            // 直接 return self，绝不调用 addTextFieldWithConfigurationHandler
            return self;
        }
        return self;
    };
}

- (UIAlertControllerBuilder *(^)(void(^config)(UIPopoverPresentationController *popover)))popoverConfig {
    return ^UIAlertControllerBuilder *(void(^config)(UIPopoverPresentationController *popover)) {
        if (self.alertController.popoverPresentationController && config) {
            config(self.alertController.popoverPresentationController);
        }
        return self;
    };
}

// 设置富文本标题
- (UIAlertControllerBuilder *(^)(NSAttributedString *attrTitle))attributedTitle {
    return ^UIAlertControllerBuilder *(NSAttributedString *attrTitle) {
        [self.alertController setValue:attrTitle forKey:@"attributedTitle"];
        return self;
    };
}
// 设置富文本内容
- (UIAlertControllerBuilder *(^)(NSAttributedString *attrMessage))attributedMessage { 
     return ^UIAlertControllerBuilder *(NSAttributedString *attrMessage) { 
         [self.alertController setValue:attrMessage forKey:@"attributedMessage"]; 
         return self; 
     }; 
 }

@end
