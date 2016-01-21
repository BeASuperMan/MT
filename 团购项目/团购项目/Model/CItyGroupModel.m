//
//  CItyGroupModel.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "CItyGroupModel.h"

@implementation CItyGroupModel
{
    NSArray *_plistArr;
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
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cityGroups.plist" ofType:nil];
    _plistArr = [NSArray arrayWithContentsOfFile:path];
    
}

//数据解析
-(NSArray *)getModelArray
{
    NSMutableArray * dataArr = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in _plistArr) {
        CItyGroupModel *model = [[CItyGroupModel alloc]init];
        model.tittle = [dict objectForKey:@"title"];
        model.cities = [dict objectForKey:@"cities"];
        [dataArr addObject:model];
    }
    return dataArr;
}
@end
