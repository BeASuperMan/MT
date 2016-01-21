//
//  CItyGroupModel.h
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CItyGroupModel : NSObject
//属性声明：1，字符串   2城市数组
@property (nonatomic,strong) NSArray *cities;
@property (nonatomic,copy) NSString *tittle;

-(NSArray*)getModelArray;
@end
