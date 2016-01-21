//
//  PopView.h
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//
/**
 *  1,声明一个协议
 *  2，声明协议中的方法
 *  3，声明一个遵守协议的id 类型的指针
 *  4，实现协议的方法（.m文件中）
 */
#import <UIKit/UIKit.h>
@class PopView;
@protocol PopViewDataSource <NSObject>
//制定协议的方法
/**
 *  1,行数
    2，每个（左右的tabView）标题
    3，每一行的图片
    4，判断是否子数据（展示数据）
    5，显示子数据（当点击的时候）
 */
-(NSInteger)numberOfRowsInLeftTable:(PopView*)popView;//左侧的行数

-(NSString*)popView:(PopView *)popView tittleForRow:(int)row;//左侧的标题

-(NSString*)popView:(PopView *)popView imageForRow:(int)row;//左侧的图片

-(NSArray*)popView:(PopView *)popView subDataForRow:(int)row;//左侧的子数据

@end

@interface PopView : UIView

@property(nonatomic,strong) NSArray *categoryArr;
/**
 *  1,协议的指针要声明为assign类型
 *  2,id类型
 *  3,遵守我们声明的协议
 */

@property(nonatomic,assign)id<PopViewDataSource> dataSource;
+(PopView*)makePopView;

@end
