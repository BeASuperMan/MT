//
//  CityGroup.h
//  团购项目
//
//  Created by 人在江湖 on 16/1/14.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityGroup : NSObject
//属性的声明 :tittle  字符串  城市数组
@property(nonatomic,strong)NSArray *cities;
@property(nonatomic,copy)NSString *title;

-(NSArray*)getModelArray;
@end
