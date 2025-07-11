//
//  DBViewController.m
//  UIAlertControllerBuilder
//
//  Created by 大笨刘 on 07/11/2025.
//  Copyright (c) 2025 大笨刘. All rights reserved.
//

#import "DBViewController.h"
#import "UIAlertControllerBuilder.h"

@interface DBViewController ()

@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"显示 Alert" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 150, 44);
    [button addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)showAlert {
    //    AlertBuilder(UIAlertControllerStyleAlert)
    //        .title(@"提示")
    //        .message(@"点击下面按钮可以打印日志。")
    //        .addAction(@"取消", UIAlertActionStyleCancel, nil, ^(UIAlertAction *action, UIAlertController *alert) {
    //            NSLog(@"取消");
    //        })
    //        .addAction(@"确定", UIAlertActionStyleDefault, [UIColor blueColor], ^(UIAlertAction *action, UIAlertController *alert) {
    //            NSLog(@"确定");
    //        })
    //        .presentIn(self);
    
    //    __weak typeof(self) weakSelf = self;
    //    AlertBuilder()
    //        .title(@"第一个")
    //        .addAction(@"下一个", UIAlertActionStyleDefault, [UIColor blueColor], ^(UIAlertAction *action, UIAlertController *alert){
    //            [alert dismissViewControllerAnimated:YES completion:^{
    //                AlertBuilder()
    //                    .title(@"第二个")
    //                    .addAction(@"确定", UIAlertActionStyleDefault, [UIColor blueColor], nil)
    //                    .presentIn(weakSelf);
    //            }];
    //        })
    //        .presentIn(self);
        
        
    //    AlertBuilder(UIAlertControllerStyleAlert)
    //        .title(@"登录")
    ////        .addTextField(^(UITextField *tf){ tf.placeholder = @"账号"; })
    //
    //        .addAction(@"登录", UIAlertActionStyleDefault, [UIColor greenColor], ^(UIAlertAction *action, UIAlertController *alert){
    //            // ...
    //        })
    //        .addAction(@"取消", UIAlertActionStyleDefault, [UIColor redColor], ^(UIAlertAction *action, UIAlertController *alert){
    //            // ...
    //        })
    //        .presentIn(self);
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        NSAttributedString *attrTitle = [[NSAttributedString alloc] initWithString:@"富文本标题"
                                                                        attributes:@{NSForegroundColorAttributeName:[UIColor greenColor],
                                                                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:30],
                                                                                     NSParagraphStyleAttributeName:style}];
        
        AlertBuilder(UIAlertControllerStyleAlert)
            .attributedTitle(attrTitle)
            .message(@"普通内容")
            .addTextField(^(UITextField *tf){
                tf.placeholder = @"账号";
            })
            .addTextField(^(UITextField *tf){
                tf.placeholder = @"密码";
                tf.secureTextEntry = YES;
            })
            .addAction(@"登录", UIAlertActionStyleDefault, [UIColor blueColor], ^(UIAlertAction *action, UIAlertController *alert){
                NSString *account = alert.textFields.firstObject.text;
                NSString *password = alert.textFields.lastObject.text;
                NSLog(@"账号：%@，密码：%@", account, password);
            })
            .addAction(@"取消", UIAlertActionStyleCancel, [UIColor grayColor], nil)
            .popoverConfig(^(UIPopoverPresentationController *popover){
                popover.sourceView = self.view;
                popover.sourceRect = CGRectMake(100, 100, 1, 1);
            })
            .presentInWithCompletion(self, ^{
                NSLog(@"弹窗已显示");
            });
}

@end
