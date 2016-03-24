//
//  YBCell.h
//  testYBCollectionViewLayout
//
//  Created by 王迎博 on 16/3/22.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBFirstCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *XibImageView;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *imageName;


@end
