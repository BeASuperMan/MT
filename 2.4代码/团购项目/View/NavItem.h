//
//  NavItem.h
//  团购项目
//
//  Created by lb on 15/5/26.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavItem : UIView

@property (nonatomic,strong)UIButton *btn;

+ (instancetype)makeItem;

- (void)addtarget:(id)target action:(SEL)action;

@end
