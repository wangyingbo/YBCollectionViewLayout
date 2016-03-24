//
//  YBCollectionViewLayout.m
//  testYBCollectionViewLayout
//
//  Created by 王迎博 on 16/3/22.
//  Copyright © 2016年 王迎博. All rights reserved.
//
//教程：http://www.jianshu.com/p/83f2d6ac7e68

#import "YBLayout.h"

//屏幕的宽和高
#define FULL_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define FULL_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@implementation YBLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    // 水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获得super已经计算好的布局属性
    NSArray *elementsArray = [super layoutAttributesForElementsInRect:rect];
    
    for (int i = 0; i < elementsArray.count; i ++){
        if (i == elementsArray.count - 1) {
            //UICollectionViewLayoutAttributes *att = [elementsArray objectAtIndex:elementsArray.count - 1];
            //NSLog(@"....indexPath.section....%ld",(long)att.indexPath.section);
        }
    }
    //NSInteger count1 = [self.collectionView numberOfSections];
    //NSInteger count2 = [self.collectionView numberOfItemsInSection:1];
    
    
    // 计算collectionView最中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    //在原有布局属性的基础上，进行微调
    for (UICollectionViewLayoutAttributes *atts in elementsArray)
    {
        // cell的中心点x 和 collectionView最中心点的x值 的间距
        CGFloat delta = ABS(atts.center.x - centerX);
        
        //根据间距值计算cell的缩放比例
        CGFloat scale = 1 - delta/self.collectionView.frame.size.width;
        
        //设置缩放比例
        atts.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    
    return elementsArray;
}



//-(CGSize)collectionViewContentSize
//{
//    
//    return self.collectionView.frame.size;
//}




//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attributes;
//    
//    return attributes;
//}




//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attributes;
//    
//    
//    return attributes;
//}





//- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//
//}



/**
 *  这个方法的特点是：当collectionView的显示范围发生改变的时候，判断是否需要重新刷新布局
 *  一旦重新刷新布局，就重新调用下面的方法:
     1.prepareLayout
     2.layoutAttibutesForElementsInrect:
 *
 *  @return 默认是NO
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}




//- (UICollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds
//{
//    UICollectionViewLayoutInvalidationContext *context;
//    
//    return context;
//}




//- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
//{
//    
//    return YES;
//}




//- (UICollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
//{
//    UICollectionViewLayoutInvalidationContext *context;
//    
//    return context;
//}




//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
//{
//    CGPoint point;
//    
//    return point;
//}



/**
 *  这个方法在手离开屏幕的时候调用,也就是cell停止滚动的时候
 *
 *  @return 返回值决定了collectionView停止滚动时的偏移量
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //计算出最终显示的矩形框
    CGRect rect ;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    //获得super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    //计算collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    //存放最小的间距值
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *atts in array) {
        //一开始先保证minDelta是最大的，保证谁都比你小。 第一次算出来的绝对值就肯定比你小，然后把它赋值给你minDelta。这样就算出来了最小的间距值
        if (ABS(minDelta) > ABS(atts.center.x - centerX)) {
            minDelta = atts.center.x - centerX;
        }
    }
    
    proposedContentOffset.x += minDelta;
    
    return proposedContentOffset;
}



@end
