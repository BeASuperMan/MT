//
//  PopView.h
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UIView
@property(nonatomic,strong) NSArray *categoryArr;


+(PopView*)makePopView;

@end
