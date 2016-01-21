//
//  CategorlyModel.h
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategorlyModel : NSObject
//图标
@property (nonatomic,copy) NSString * highlighted_icon;
@property (nonatomic,copy) NSString * small_highted_icon;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * small_icon;
//名称
@property (nonatomic,copy) NSString * name;
//子数据数组
@property (strong,nonatomic) NSArray * subcategories;
//获取本地plist数据
-(NSArray*)loadPlistData;
@end
