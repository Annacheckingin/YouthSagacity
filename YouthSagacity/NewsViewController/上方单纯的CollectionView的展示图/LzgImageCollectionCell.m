//
//  LzgImageCollectionCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgImageCollectionCell.h"
@interface LzgImageCollectionCell()

@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation LzgImageCollectionCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        _imageView=[[UIImageView alloc]init];
        _imageView.userInteractionEnabled=YES;
        _imageView.layer.cornerRadius=5;
        _imageView.clipsToBounds=YES;
    }
    [self.contentView addSubview:_imageView];
    _imageView.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView);
    return self;
}
@end
