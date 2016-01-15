//
//  CategoriyModel.m
//  团购项目
//
//  Created by lb on 15/5/28.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "CategoriyModel.h"

@implementation CategoriyModel

//加载plist文件
- (NSArray *)loadPlistData{
    //获取plist文件地址
    NSString *file = [[NSBundle mainBundle]pathForResource:@"categories.plist" ofType:nil];
    //加载plist为数组
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:file];
    NSArray *dataArray = [self getDataWithArray:plistArray];
    return dataArray;
}

//字典转模型
- (CategoriyModel *)makeModelWithDict:(NSDictionary *)dict{
    self.highlighted_icon = [dict objectForKey:@"highlighted_icon"];
    self.icon = [dict objectForKey:@"icon"];
    self.small_highlighted_icon = [dict objectForKey:@"small_highlighted_icon"];
    self.small_icon = [dict objectForKey:@"small_icon"];
    self.name = [dict objectForKey:@"name"];
    self.subcategories = [dict objectForKey:@"subcategories"];
    return self;
}

//解析
- (NSArray *)getDataWithArray:(NSArray *)array{
    NSMutableArray *Arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in array) {
        CategoriyModel *md = [[CategoriyModel alloc]init];
        [md makeModelWithDict:dict];
        [Arr addObject:md];
    }
    return Arr;
}

@end
