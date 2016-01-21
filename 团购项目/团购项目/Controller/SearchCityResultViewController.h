//
//  SearchCityResultViewController.h
//  团购项目
//
//  Created by lb on 15/6/17.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCityResultViewController : UITableViewController

@property (nonatomic,copy)NSString *searchText;

@property (nonatomic,strong)NSArray *citiesArray;

@end
