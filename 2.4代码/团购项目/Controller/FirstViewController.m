//
//  FirstViewController.m
//  团购项目
//
//  Created by lb on 15/5/26.
//  Copyright (c) 2015年 lbcoder. All rights reserved.
//

#import "FirstViewController.h"
#import "NavItem.h"
#import "PopViewController.h"
#import "SecondPopViewController.h"

@interface FirstViewController (){
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
}

@end

@implementation FirstViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    return [self initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

}

#pragma mark - 创建导航栏
- (void)createNavBar{
    //1. logo
    UIBarButtonItem *logo = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    //2. 3个UIbarButtonItem
    NavItem *first = [NavItem makeItem];
    [first addtarget:self action:@selector(firstClick)];
    NavItem *second = [NavItem makeItem];
    [second addtarget:self action:@selector(secondClick)];
    NavItem *third = [NavItem makeItem];
    [third addtarget:self action:@selector(thirdClick)];

    firstItem= [[UIBarButtonItem alloc]initWithCustomView:first];
    
    
    secondItem = [[UIBarButtonItem alloc]initWithCustomView:second];

    thirdItem = [[UIBarButtonItem alloc]initWithCustomView:third];
    self.navigationItem.leftBarButtonItems = @[logo,firstItem,secondItem,thirdItem];
}

#pragma mark - 点击事件
- (void)firstClick{
    [self createPopver];
}
- (void)secondClick{
    [self creatSecondPopver];

}
- (void)thirdClick{
    NSLog(@"1");

}

#pragma mark - 第一个下拉菜单
- (void)createPopver{
    PopViewController *pvc = [[PopViewController alloc]init];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
#pragma mark - 第二个下拉菜单
-(void)creatSecondPopver
{
    SecondPopViewController *svc = [[SecondPopViewController alloc]initWithNibName:@"SecondPopViewController" bundle:nil];
    
//    SecondPopViewController *secondVC =[SecondPopViewController new];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:svc];
    [pop presentPopoverFromBarButtonItem:secondItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
