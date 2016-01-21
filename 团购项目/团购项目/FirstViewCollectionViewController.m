//
//  FirstViewCollectionViewController.m
//  美团HD
//
//  Created by 人在江湖 on 16/1/21.
//  Copyright © 2016年 lbcoder. All rights reserved.
//

#import "FirstViewCollectionViewController.h"
#import "NavItem.h"
#import "PopViewController.h"
#import "SecondPopViewController.h"
#import "CItyGroupModel.h"
@interface FirstViewCollectionViewController ()
{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
}

@end

@implementation FirstViewCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
-(instancetype)init
{
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    return [self initWithCollectionViewLayout:layOut];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self creatNavBar];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
//    CItyGroupModel *md = [[CItyGroupModel alloc]init];
//    NSArray *arr = [md getModelArray];
//    for (CItyGroupModel *md in arr) {
//        NSLog(@"%@",md.tittle);
//    }
}

#pragma mark - 创建导航栏
-(void)creatNavBar
{
    //1,logo
    UIBarButtonItem *logo = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = logo;
    //2, 创建三个UIBarButtonItem
    NavItem *first  = [NavItem makeItem];
    [first addtarget:self action:@selector(firstClick)];
    NavItem *second = [NavItem makeItem];
    [second addtarget:self action:@selector(secondClick)];
    NavItem *third  = [NavItem makeItem];
    [third addtarget:self action:@selector(thirdClick)];
    
    firstItem = [[UIBarButtonItem alloc]initWithCustomView:first];
    secondItem = [[UIBarButtonItem alloc]initWithCustomView:second];
    thirdItem = [[UIBarButtonItem alloc]initWithCustomView:third];
    
    self.navigationItem.leftBarButtonItems = @[logo,firstItem,secondItem,thirdItem];
    
}
#pragma mark - 点击事件
-(void)firstClick
{
    [self creatPoper];
}
-(void)secondClick
{
    [self creatSecondPopVer];
}
-(void)thirdClick
{
    [self creatThirdPopVer];
    NSLog(@"第三个tabBar点击");
    
}
#pragma mark - 第一个创建下拉菜单
-(void)creatPoper
{
    PopViewController *popVc = [[PopViewController alloc]init];
    UIPopoverController *pop = [[UIPopoverController alloc]initWithContentViewController:popVc];
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
#pragma mark - 第二个创建下拉菜单
-(void)creatSecondPopVer
{
    SecondPopViewController *secondPopVC = [SecondPopViewController new];
    UIPopoverController *popVC = [[UIPopoverController alloc]initWithContentViewController:secondPopVC];
    [popVC presentPopoverFromBarButtonItem:secondItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    CItyGroupModel *cityModel = [CItyGroupModel new];
    [cityModel getModelArray];
    
}
#pragma mark - 第三个个创建下拉菜单
-(void)creatThirdPopVer
{
    
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
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
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
