//
//  ChangeCityViewController.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "CItyGroupModel.h"
@interface ChangeCityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArray;
}

@end

@implementation ChangeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//标题
    self.title = @"切换城市";
//    关闭按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_navigation_close"] style:UIBarButtonItemStyleDone target:self action:@selector(backToVC)];
    self.navigationItem.leftBarButtonItem = leftItem;
    //获取数据源
    CItyGroupModel *md = [[CItyGroupModel alloc]init];
    _dataArray = [md getModelArray];
    
}
-(void)backToVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma  Mark - tabView delegate
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [[_dataArray objectAtIndex:section]cities].count;//获取哪一个分组_然后分组里面的数据
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"tabCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    CItyGroupModel *model = [_dataArray objectAtIndex: indexPath.section];
    cell.textLabel.text = model.cities [indexPath.row];
    return cell;
}
//分组的头部
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
        CItyGroupModel *model = [_dataArray objectAtIndex:section];
    return model.tittle;
    
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
