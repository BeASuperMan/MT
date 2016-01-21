//
//  NavItem.h
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavItem : UIView
//创建导航按钮
+(instancetype)makeItem;
//声明点击方法
-(void)addtarget:(id)target action:(SEL)action;
@end
