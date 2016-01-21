//
//  SearchCityResultViewController.m
//  团购项目
//
//  Created by lb on 15/6/17.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "SearchCityResultViewController.h"
#import "Cities.h"

@interface SearchCityResultViewController (){
    NSMutableArray *_searchResultArray;
}

@end

@implementation SearchCityResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setSearchText:(NSString *)searchText
{
    _searchText = [searchText lowercaseString];//获取的字符串，小写转换
//    NSLog(@"获取搜索字符成功%@",_searchText);
//    获取城市数组
    if (!_citiesArray) {
        _citiesArray = [Cities getCities];
//            NSLog(@"%@",_citiesArray);
    }
    _searchResultArray = [NSMutableArray new];
//    遍历判断，获取数据
    for (Cities *city in _citiesArray) {
        if ([city.name containsString:_searchText]||[city.pingYin containsString:_searchText]||[city.pingHead containsString:_searchText]) {
            [_searchResultArray addObject:city];
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%d",_searchResultArray.count);
    return _searchResultArray.count;
}
#pragma mark - Table view dataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"searchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
    Cities *city = [_searchResultArray objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;

    return cell;
}


@end
