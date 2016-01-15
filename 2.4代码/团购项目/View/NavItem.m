//
//  NavItem.m
//  团购项目
//
//  Created by lb on 15/5/26.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "NavItem.h"

@interface NavItem ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation NavItem

+ (instancetype)makeItem{
    return [[[NSBundle mainBundle]loadNibNamed:@"NavItem" owner:self options:nil]firstObject];
}

- (void)addtarget:(id)target action:(SEL)action{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
