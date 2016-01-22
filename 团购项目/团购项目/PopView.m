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
//@property(strong,nonatomic) CategorlyModel *selectModel;
@property (nonatomic,assign) NSInteger selectRow;//记录当前左侧列表选中的行号
@end
@implementation PopView
+(PopView *)makePopView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"popView" owner:self options:nil]lastObject];
}

#pragma Mark---tabView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTabView) {
        return [self.dataSource numberOfRowsInLeftTable:self];
    }
    else
    {
        return [self.dataSource popView:self subDataForRow:_selectRow].count;//拿到左侧选中行的数组，返回一个count
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
        cell.textLabel.text = [self.dataSource popView:self tittleForRow:indexPath.row];
        NSString *imageName = [self.dataSource popView:self imageForRow:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageName];
        NSArray *subDataArray = [self.dataSource popView:self subDataForRow:indexPath.row];
        if (subDataArray.count)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//带右侧的箭头
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
        cell.textLabel.text = [self.dataSource popView:self subDataForRow:_selectRow][indexPath.row] ;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTabView) {
        self.selectRow = indexPath.row;//记录选中的行（左侧）
        [_rightTabView reloadData];
        
        if ([self.delegate respondsToSelector:@selector(popView:didSelectRowAtLeftTable:)]) {
            //进一步实现  如果没有子数据，直接发送通知
            [self.delegate popView:self didSelectRowAtLeftTable:indexPath.row];
            
        }

        
    }
    else
    {
        if ([self.delegate respondsToSelector:@selector(popView:didSelectRowAtRightTable:)]) {
            //
            [self.delegate popView:self didSelectRowAtRightTable:indexPath.row];
        }
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
