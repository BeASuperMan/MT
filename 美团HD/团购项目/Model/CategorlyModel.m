//
//  CategorlyModel.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "CategorlyModel.h"

@implementation CategorlyModel
//加载plist文件
-(NSArray*)loadPlistData
{
  NSString *file      = [[NSBundle mainBundle]pathForResource:@"categories" ofType:@"plist"];
  NSArray *plistArray = [NSArray arrayWithContentsOfFile:file];
  NSArray *dataArr    = [self getDataWithArray:plistArray];
    return dataArr;
}
//字典转模型
-(CategorlyModel *)makeModelWithPlistDict:(NSDictionary*)dict
{
    self.highlighted_icon   = [dict objectForKey:@"highlighted_icon"];
    self.icon               = [dict objectForKey:@"icon"];
    self.small_highted_icon = [dict objectForKey:@"small_highlighted_icon"];
    self.small_icon         = [dict objectForKey:@"small_icon"];
    self.name               = [dict objectForKey:@"name"];
    self.subcategories      = [dict objectForKey:@"subcategories"];
    return self;
}
//解析数据
-(NSArray *)getDataWithArray:(NSArray*)array
{
    NSMutableArray *Arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in array) {
        CategorlyModel  * md = [[CategorlyModel alloc]init];
        [md makeModelWithPlistDict:dict];
        [Arr addObject:md];
    }
    return Arr;
}
@end
