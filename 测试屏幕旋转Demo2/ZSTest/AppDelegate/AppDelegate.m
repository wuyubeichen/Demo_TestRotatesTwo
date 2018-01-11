//
//  AppDelegate.m
//  Test
//
//  Created by zhoushuai on 16/3/7.
//  Copyright © 2016年 zhoushuai. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "FirstViewController.h"
@interface AppDelegate ()


@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //拿到设备屏幕的大小
    CGRect rect = [UIScreen mainScreen].bounds;
    //创建一个window
    self.window = [[UIWindow alloc] initWithFrame:rect];
    self.window.backgroundColor = [UIColor orangeColor];
    //把当前的window作为程序的主window显示出来
    [self.window makeKeyAndVisible];
    
    //设置根视图控制器
    FirstViewController *firstVC = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    BaseNavigationController *firstNVC = [[BaseNavigationController alloc] initWithRootViewController:firstVC];
    self.window.rootViewController = firstNVC;
    
    //添加旋转通知
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(onDeviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    return YES;
}



//此方法会在设备横竖屏变化的时候调用
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (_allowAutoRotate) {
        //只支持横屏
        return UIInterfaceOrientationMaskLandscape;
    }else{
        //支持竖屏
        return UIInterfaceOrientationMaskPortrait;
    }
}


#pragma mark - Notification：

- (BOOL)onDeviceOrientationDidChange{
    //获取当前设备Device
    UIDevice *device = [UIDevice currentDevice] ;
    //识别当前设备的旋转方向
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕幕朝上平躺");
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;
        case UIDeviceOrientationUnknown:
            //系统当前无法识别设备朝向，可能是倾斜
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左橫置");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            break;
            
        default:
            NSLog(@"無法识别");
            break;
    }
    return YES;
}

@end
