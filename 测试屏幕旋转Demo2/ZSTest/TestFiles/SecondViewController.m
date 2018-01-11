//
//  SecondViewController.m
//  ZSTest
//
//  Created by Bjmsp on 2018/1/8.
//  Copyright © 2018年 zhoushuai. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"secondVC";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    AppDelegate* delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.allowAutoRotate = YES;
    //进入界面：设置横屏
    [self setDeviceInterfaceOrientation:UIDeviceOrientationLandscapeLeft];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    AppDelegate* delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.allowAutoRotate = NO;
    //离开界面:设置竖屏
    [self setDeviceInterfaceOrientation:UIDeviceOrientationPortrait];
}

#pragma mark - Respond To Events
- (IBAction)enterThirdVCBtnClick:(id)sender {
    ThirdViewController *thiridVC = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    [self.navigationController pushViewController:thiridVC animated:YES];
}



#pragma mark - private Methods
//方法1和方法2只有在shouldAutorotate返回YES的时候生效
//因为项目中未对shouldAutorotate覆写过，默认就是YES的
//方法1：强制屏幕旋转
- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

//方法2：强制屏幕旋转
- (void)setDeviceInterfaceOrientation:(UIDeviceOrientation)orientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:orientation] forKey:@"orientation"];
    }
}

@end
