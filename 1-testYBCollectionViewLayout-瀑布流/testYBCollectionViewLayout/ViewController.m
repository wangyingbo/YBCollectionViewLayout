//
//  ViewController.m
//  testYBCollectionViewLayout
//
//  Created by 王迎博 on 16/3/23.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "YBLayout.h"
#import "YBPhotoCell.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

static NSString * const YBPhotoCellID = @"photo";

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建布局
    YBLayout *layout = [[YBLayout alloc] init];
    
    // 创建CollectionView
    [_collectionView setCollectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:_collectionView];
    
    // 注册
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YBPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:YBPhotoCellID];

}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YBPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YBPhotoCellID forIndexPath:indexPath];
    
    cell.imageName = [NSString stringWithFormat:@"%ld.jpg", indexPath.item + 1];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%zd", indexPath.item);
}

@end
