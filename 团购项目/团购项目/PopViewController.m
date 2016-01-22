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
@interface PopViewController ()<PopViewDataSource,PopViewDelegate>//5.遵守协议
{
//    NSArray *_categoryArr;//获取所有分类数据模型
    CategorlyModel *_seletedMode;//选中（判断是否有子数据）
}

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _categoryArr = [self getData];//获取所有分类数据模型
   PopView *pop    = [PopView makePopView];

    pop.delegate = self;
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
//获取到第一个分类数据下拉菜单的模型数组
-(NSArray*)getData
{
    CategorlyModel *model = [CategorlyModel new];
    NSArray *categorlyieyArr = [model loadPlistData];
    return categorlyieyArr;
}
#pragma mark - PopViewDataSource  //6 遵守协议中的方法
-(NSInteger)numberOfRowsInLeftTable:(PopView *)popView
{
    NSArray *array =  [self getData];
    return array.count;
}
-(NSString*)popView:(PopView *)popView tittleForRow:(int)row
{
    return [[self getData][row]name];//拿到name属性
}
-(NSString *)popView:(PopView *)popView imageForRow:(int)row
{
    return [[self getData][row]small_icon];
}
-(NSArray*)popView:(PopView *)popView subDataForRow:(int)row
{
    return [[self getData][row] subcategories];
}
#pragma mark - PopViewDelegate
-(void)popView:(PopView *)popView didSelectRowAtLeftTable:(int)row
{//选择了左侧的表格
    NSArray *categorArr = [self getData];
    _seletedMode = categorArr[row];//选中哪一行
//    CategorlyModel *model = categorArr[row];
//    通过row获取选中某一行对应的模型
//    判断模型有没有子数据
    if (!_seletedMode.subcategories.count) {
        //发送通知
        //发送通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"categoryModel":_seletedMode}];
    }
}
-(void)popView:(PopView *)popView didSelectRowAtRightTable:(int)row
{
    NSArray *subArr = _seletedMode.subcategories;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"subCategoryDidChanged" object:nil userInfo:@{@"categoryModel":_seletedMode,@"subCategoryName":subArr[row]}];
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
