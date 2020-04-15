//
//  LzgLikeCollectionVIewCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/14.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLikeCollectionVIewCell.h"
@interface LzgLikeCollectionVIewCell()
@property(nonatomic,strong)UILabel *titile;
@property(nonatomic,strong)UILabel *briefContent;
@property(nonatomic,strong)UIView *kBaseview;
@end

@implementation LzgLikeCollectionVIewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        self.contentView.backgroundColor=UIColor.clearColor;
        self.backgroundColor=UIColor.clearColor;
        _kBaseview=[[UIView alloc]init];
        _kBaseview.layer.borderColor=UIColor.lightGrayColor.CGColor;
        _kBaseview.layer.borderWidth=0.2;
        _kBaseview.backgroundColor=UIColor.whiteColor;
        [self.contentView addSubview:_kBaseview];
        _kBaseview.sd_layout
        .leftEqualToView(self.contentView)
        .topEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(80*LZGHEIGHT);
        _kBaseview.layer.cornerRadius=5;
        _kBaseview.clipsToBounds=YES;
        //
        _titile=[[UILabel alloc]init];
        _titile.font=[UIFont systemFontOfSize:13];
        _titile.textColor=UIColor.blackColor;
        _briefContent=[[UILabel alloc]init];
        _briefContent.font=[UIFont systemFontOfSize:12];
        _briefContent.textColor=UIColor.lightGrayColor;
        _briefContent.numberOfLines=0;
        _briefContent.lineBreakMode=NSLineBreakByTruncatingTail;
        [_kBaseview sd_addSubviews:@[_titile,_briefContent]];
        //
        _titile.sd_layout
        .leftSpaceToView(_kBaseview, 2*LZGWIDTH)
        .topSpaceToView(_kBaseview, 2*LZGHEIGHT)
        .heightIs(18*LZGHEIGHT);
        [_titile setSingleLineAutoResizeWithMaxWidth:320*LZGWIDTH];
        //
        _briefContent.sd_layout
        .topSpaceToView(_titile, 2*LZGHEIGHT)
        .leftSpaceToView(_kBaseview, 2*LZGWIDTH)
        .rightSpaceToView(_kBaseview, 2*LZGWIDTH)
        .bottomSpaceToView(_kBaseview, 2*LZGHEIGHT);
       
    }
    return self;
}
@end
