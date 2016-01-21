//
//  Cities.h
//  美团HD
//
//  Created by 人在江湖 on 16/1/22.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cities : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *pingYin;
@property (nonatomic,copy) NSString *pingHead;
@property (nonatomic,strong) NSArray *region;

+(NSArray *)getCities;
@end
