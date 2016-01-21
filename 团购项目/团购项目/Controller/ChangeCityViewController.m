//
//  ChangeCityViewController.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "CItyGroupModel.h"
#import "UIView+AutoLayout.h"
#import "SearchCityResultViewController.h"

@interface ChangeCityViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    NSArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UIView *coverView;//蒙版（遮盖）
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) SearchCityResultViewController *searchResultVC;

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
#pragma mark - UISearchBar
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.coverView.hidden = NO;
    //优化，隐藏导航栏当编辑的时候
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
        self.coverView.hidden = YES;
    //优化，隐藏导航栏当结束编辑的时候
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length) {
        self.searchResultVC.view.hidden = NO;
        self.searchResultVC.searchText  = searchText;//传值
    }
    else
    {
                self.searchResultVC.view.hidden = YES;
    }
}
#pragma mark - 创建搜索结果控制器
- (SearchCityResultViewController *)searchResultVC{
    //懒加在
    if (!_searchResultVC) {
        self.searchResultVC = [[SearchCityResultViewController alloc]init];
        //将搜索结果VC添加到当前控制器中
        [self.view addSubview:_searchResultVC.view];
        //添加约束 设置搜索结果控制器的尺寸位置
        [self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        //让searchResultVC的顶部 贴着搜索框的底部  不遮盖住搜索框
        [self.searchResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchBar];
    }
    return _searchResultVC;
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
