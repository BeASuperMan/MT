//
//  PopViewController.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "PopViewController.h"
#import "PopView.h"
#import "CategorlyModel.h"
@interface PopViewController ()<PopViewDataSource>//5.遵守协议
{
    NSArray *_categoryArr;//获取所有分类数据模型
}

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _categoryArr = [self getData];//获取所有分类数据模型
   PopView *pop    = [PopView makePopView];
    
    pop.dataSource = self;//非常重要。设置当前数据源
    
    pop.categoryArr = [self getData];
    [self.view addSubview:pop];
    pop.autoresizingMask = UIViewAutoresizingNone;
    self.preferredContentSize = CGSizeMake(pop.frame.size.width, pop.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray*)getData
{
    CategorlyModel *model = [CategorlyModel new];
    NSArray *categorlyieyArr = [model loadPlistData];
    return categorlyieyArr;
}
#pragma mark - PopViewDataSource  //6 遵守协议中的方法
-(NSInteger)numberOfRowsInLeftTable:(PopView *)popView
{
//    NSArray *array =  [self getData];
    return _categoryArr.count;
}
-(NSString*)popView:(PopView *)popView tittleForRow:(int)row
{
    return [_categoryArr[row] name];//拿到name属性
}
-(NSString *)popView:(PopView *)popView imageForRow:(int)row
{
    return [_categoryArr[row] small_icon];
}
-(NSArray*)popView:(PopView *)popView subDataForRow:(int)row
{
    return [_categoryArr[row] subcategories];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
