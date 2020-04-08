//
//  HomeViewControllerCollectionVIewCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "HomeViewControllerCollectionVIewCell.h"
@interface HomeViewControllerCollectionVIewCell ()

@property(nonatomic,strong)UIView *basementView;

-(void)kSetUpUI;
@end

@implementation HomeViewControllerCollectionVIewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    /*
     
     @property(nonatomic,strong)UILabel *cellTitle;
     @property(nonatomic,strong)UIImageView *cellImage;
     @property(nonatomic,strong)UILabel *cellDate;
     @property(nonatomic,strong)UILabel *cellAuthor;
     @property(nonatomic,strong)UIButton *warnningBtn;
     @property(nonatomic,strong)UIButton *forbidBtn;
     @property(nonatomic,strong)UIButton *detailsBtn;
     **/
    if (self=[super initWithFrame:frame])
    {
        self.backgroundColor=UIColor.clearColor;
        _basementView=[[UIView alloc]init];
        _basementView.backgroundColor=UIColor.whiteColor;
        _basementView.layer.cornerRadius=10;
        _basementView.clipsToBounds=YES;
        _cellTitle=[[UILabel alloc]init];
        _cellTitle.font=[UIFont systemFontOfSize:10];
        _cellTitle.lineBreakMode=NSLineBreakByTruncatingTail;
        _cellImage=[[UIImageView alloc]init];
        _cellImage.layer.cornerRadius=5;
        _cellImage.clipsToBounds=YES;
        _cellImage.contentMode=UIViewContentModeScaleAspectFill;
        _cellDate=[[UILabel alloc]init];
        _cellDate.textColor=UIColor.lightGrayColor;
        _cellDate.font=[UIFont systemFontOfSize:8];
        _cellAuthor=[[UILabel alloc]init];
        _cellAuthor.font=_cellTitle.font;
        _warnningBtn=[[UIButton alloc]init];
        [_warnningBtn setImage:[UIImage imageNamed:@"5_40"] forState:UIControlStateNormal];
        _warnningBtn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _forbidBtn=[[UIButton alloc]init];
        [_forbidBtn setImage:[UIImage imageNamed:@"5_37"] forState:UIControlStateNormal];
        _detailsBtn=[[UIButton alloc]init];
        _detailsBtn.imageView.contentMode=_warnningBtn.imageView.contentMode;
        [_detailsBtn setImage:[UIImage imageNamed:@"normaldetail"] forState:UIControlStateNormal];
        _detailsBtn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self kSetUpUI];
    }
    return self;
}
-(void)kSetUpUI
{
    [self.contentView addSubview:_basementView];
    [_basementView sd_addSubviews:@[_cellTitle,_cellDate,_cellImage,_cellAuthor, _warnningBtn,_forbidBtn,_detailsBtn]];
    //
    _basementView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView);
    //
    //
    _cellTitle.sd_layout
    .topSpaceToView(_basementView, 5*LZGHEIGHT)
    .leftSpaceToView(_basementView, 2*LZGWIDTH)
    .rightSpaceToView(_basementView, 2*LZGWIDTH)
    .heightIs(12*LZGHEIGHT);
    //
    _cellDate.sd_layout
    .topSpaceToView(_cellTitle, 2*LZGHEIGHT)
    .leftEqualToView(_cellTitle)
    .heightIs(9*LZGHEIGHT);
    [_cellDate setSingleLineAutoResizeWithMaxWidth:200];
    //
    _cellImage.sd_layout
    .topSpaceToView(_cellDate, 10*LZGHEIGHT)
    .leftEqualToView(_cellTitle)
    .rightEqualToView(_cellTitle)
    .heightIs(100*LZGHEIGHT);
    //
    _cellAuthor.sd_layout
    .leftEqualToView(_cellImage)
    .topSpaceToView(_cellImage, 2*LZGHEIGHT)
     .heightIs(8*LZGHEIGHT);
    [_cellAuthor setSingleLineAutoResizeWithMaxWidth:100];
    //
    //
    _forbidBtn.sd_layout
    .rightEqualToView(_cellImage)
    .centerYEqualToView(_cellAuthor)
    .heightIs(20*LZGHEIGHT)
    .widthEqualToHeight();
    //
    _warnningBtn.sd_layout
    .rightSpaceToView(_forbidBtn, 2*LZGWIDTH)
    .centerYEqualToView(_forbidBtn)
    .heightRatioToView(_forbidBtn, 1)
    .widthEqualToHeight();
    
}
-(void)setDelegate:(id<HomeViewControllerCollectionVIewCellDelegate>)delegate
{
    _delegate=delegate;
    if ([_delegate conformsToProtocol:@protocol(HomeViewControllerCollectionVIewCellDelegate) ])
    {
        [_warnningBtn addTarget:_delegate action:@selector(HomeViewControllerCollectionVIewCellWarningTargetActionMethod:) forControlEvents:UIControlEventTouchUpInside];
        [_forbidBtn addTarget:_delegate action:@selector(HomeViewControllerCollectionVIewCellForBideTargetActionMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
}
@end
