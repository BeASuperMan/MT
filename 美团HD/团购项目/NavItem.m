//
//  NavItem.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "NavItem.h"

@interface NavItem ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
@implementation NavItem

+(instancetype)makeItem
{
    return [[[NSBundle mainBundle]loadNibNamed:@"NavItem" owner:self options:nil]lastObject];
}
-(void)addtarget:(id)target action:(SEL)action
{
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
