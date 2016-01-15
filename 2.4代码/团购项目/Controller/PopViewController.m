//
//  PopViewController.m
//  团购项目
//
//  Created by lb on 15/5/27.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "PopViewController.h"
#import "popView.h"
#import "CategoriyModel.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    popView *pop = [popView makePopView];
    [self.view addSubview:pop];
    pop.categoryArr = [self getData];
    pop.autoresizingMask = UIViewAutoresizingNone;
    self.preferredContentSize = CGSizeMake(pop.frame.size.width, pop.frame.size.height);
}

//获取到 第一个分类数据下拉菜单的模型数组
- (NSArray *)getData{
    CategoriyModel *md = [[CategoriyModel alloc]init];
    NSArray *categorieyArray = [md loadPlistData];
    return categorieyArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
