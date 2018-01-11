//
//  FirstViewController.m
//  ZSTest
//
//  Created by zhoushuai on 16/8/10.
//  Copyright © 2016年 zhoushuai. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"firstVC";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - Respond To Events
- (IBAction)secondVCBtnClick:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
