//
//  PopView.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "PopView.h"
#import "CategorlyModel.h"
@interface PopView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTabView;
@property (weak, nonatomic) IBOutlet UITableView *rightTabView;
@property(strong,nonatomic) CategorlyModel *selectModel;
@end
@implementation PopView
+(PopView *)makePopView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"popView" owner:self options:nil]lastObject];
}

#pragma Mark---tabView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTabView) {
        return _categoryArr.count;
    }
    else
    {
        return _selectModel.subcategories.count;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *str = @"MyCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
//    }
//    return cell;
    if (tableView == _leftTabView) {
        static NSString *str = @"MyCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        CategorlyModel *model = [_categoryArr objectAtIndex:indexPath.row];
        cell.textLabel.text = model.name;
        NSString *imageName = model.small_icon;
        cell.imageView.image = [UIImage imageNamed:imageName];
        if (model.subcategories.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        
        return cell;
    }
    else
    {
        static NSString *str = @"MyCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text = _selectModel.subcategories[indexPath.row];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTabView) {
        _selectModel = [_categoryArr objectAtIndex:indexPath.row];
        [_rightTabView reloadData];
    }
    
}



/*
// Only
 override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
