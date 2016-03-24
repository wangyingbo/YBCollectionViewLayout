//
//  ViewController.m
//  testYBCollectionViewLayout
//
//  Created by 王迎博 on 16/3/22.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "YBFirstCell.h"
#import "YBLayout.h"

//屏幕的宽和高
#define FULL_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define FULL_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

#define VIEWLAYOUT_W  FULL_SCREEN_WIDTH/375
#define VIEWLAYOUT_H  FULL_SCREEN_HEIGHT/667

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.alwaysBounceVertical = YES;
    
    static NSString *identifier = @"firstCell";
    [_collectionView registerClass:[YBFirstCell class] forCellWithReuseIdentifier:identifier];
    
    YBLayout *layout = [[YBLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    [_collectionView setCollectionViewLayout:layout];
    
}



#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YBFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"firstCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.imageName = [NSString stringWithFormat:@"%ld.jpg", indexPath.item + 1];
    return cell;
}




#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}




# pragma mark -- UICollectionViewDelegateFlowLayout

/**
 *  section的四边距,设定全局的区内边距，如果想要设定指定区的内边距，可以使用下面方法
 */
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
//    
//    if (section == 0)//自定义第一个section的四边距
//    {
//        UIEdgeInsets insetsSection0 = UIEdgeInsetsMake(0, 0, 10, 0);
//        insets = insetsSection0;
//    }
//    return insets;
//}


/**
 *  cell的大小，单独定义某个Cell的尺寸
 */
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGSize size;
//    if (indexPath.section == 0)//自定义第一个section的cell
//    {
//        //        size = CGSizeMake(FULL_SCREEN_WIDTH, 180*(FULL_SCREEN_HEIGHT/667));
//        size = CGSizeMake(FULL_SCREEN_WIDTH/5-10, 60*VIEWLAYOUT_H);
//    }
//    else
//    {
//        size = CGSizeMake((FULL_SCREEN_WIDTH-60)/4, (FULL_SCREEN_WIDTH-60)/4);
//    }
//    return size;
//}
//
//
//
////cell的最小行间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 12;
//}
@end
