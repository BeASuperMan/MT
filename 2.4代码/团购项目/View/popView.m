//
//  popView.m
//  团购项目
//
//  Created by lb on 15/5/27.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "popView.h"
#import "CategoriyModel.h"

@interface popView ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;
@property (strong,nonatomic) CategoriyModel *seletedModel;

@end

@implementation popView

+ (popView *)makePopView{
    return [[[NSBundle mainBundle]loadNibNamed:@"popView" owner:self options:nil]firstObject];
}


#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTV) {
        return _categoryArr.count;
    }else{
        return _seletedModel.subcategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTV) {
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        CategoriyModel *md = [_categoryArr objectAtIndex:indexPath.row];
        cell.textLabel.text = md.name;
        cell.imageView.image = [UIImage imageNamed:md.small_icon];
        if (md.subcategories.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }else{
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text = _seletedModel.subcategories[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTV) {
        _seletedModel = [_categoryArr objectAtIndex:indexPath.row];
        [_rightTV reloadData];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
