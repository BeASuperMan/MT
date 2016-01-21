//
//  Cities.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/22.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "Cities.h"

@implementation Cities

+ (NSArray*)getCities
{
//    1,加载plist文件
    NSString *path = [[NSBundle mainBundle ]pathForResource:@"cities.plist" ofType:nil];
//    2,加载plist文件为数组、
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
//    3。遍历数组。字典转模型
    NSMutableArray *modeArr = [NSMutableArray new];
    for (NSDictionary *dict in plistArray) {
        Cities *model = [Cities new];
        model.name     = [dict objectForKey:@"name"];
        model.pingYin  = [dict objectForKey:@"pinYin"];
        model.pingHead = [dict objectForKey:@"pinYinHead"];
        model.region   = [dict objectForKey:@"region"];
        [modeArr addObject:model];
    }
    return modeArr;
}
@end
