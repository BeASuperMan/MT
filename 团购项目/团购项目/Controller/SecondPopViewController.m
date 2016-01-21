//
//  SecondPopViewController.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "SecondPopViewController.h"
#import "ChangeCityViewController.h"
#import "MyNavController.h"

@interface SecondPopViewController ()

@end

@implementation SecondPopViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
/**
 *  切换城市点击事件
 *
 *  @param sender 触发button
 */
- (IBAction)changeCityClick:(id)sender {
    ChangeCityViewController *changeCityVC = [[ChangeCityViewController alloc]initWithNibName:@"ChangeCityViewController" bundle:nil];
    MyNavController *nav = [[MyNavController alloc]initWithRootViewController:changeCityVC];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
//    nav.modalPresentationStyle = UIModalPresentationCurrentContext;
//    nav.modalPresentationStyle = UIModalPresentationPageSheet;
//    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    UIModalPresentationFullScreen = 0,
//    UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//    UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//    UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
//    UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
//    UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
//    UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
//    UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
//    UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1,
    [self presentViewController:nav animated:YES completion:nil];
}



@end
