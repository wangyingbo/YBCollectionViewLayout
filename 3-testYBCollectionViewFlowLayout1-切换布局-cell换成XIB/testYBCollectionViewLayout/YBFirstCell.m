//
//  YBCell.m
//  testYBCollectionViewLayout
//
//  Created by 王迎博 on 16/3/22.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "YBFirstCell.h"

@implementation YBFirstCell

- (void)awakeFromNib
{
    self.XibImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.XibImageView.layer.borderWidth = 10;
}


//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        _imageView = [[UIImageView alloc]init];
////        _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.imageView.layer.borderWidth = 10;
//        [self addSubview:_imageView];
//    }
//    
//    return self;
//}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    
//
//}


- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
//    self.imageView.image = [UIImage imageNamed:_imageName];
    self.XibImageView.image = [UIImage imageNamed:_imageName];
}


@end
