//
//  CityGroup.m
//  团购项目
//
//  Created by 人在江湖 on 16/1/14.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "CityGroup.h"

@implementation CityGroup
{
    NSArray * _plistArray;
}
-(instancetype)init
{
    if (self = [super init]) {
        [self loadPlist];
    }
    return self;
}
-(void)loadPlist
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cityGroups" ofType:nil];
    _plistArray = [NSArray arrayWithContentsOfFile:path];
}
-(NSArray*)getModelArray
{
    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    for (NSDictionary* dict in _plistArray) {
        CityGroup *model = [[CityGroup alloc]init];
        model.title = [dict objectForKey:@"tittle"];
        model.cities = [dict objectForKey:@"cities"];
        [dataArray addObject:model];
    }
    return dataArray;
}

@end
