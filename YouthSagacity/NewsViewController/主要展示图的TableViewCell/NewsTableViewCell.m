//
//  NewsTableViewCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
#import "LzgLabel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewCell ()
@property(nonatomic,strong)UIView *baseMentview;
@property(nonatomic,strong)UILabel *cellTitle;
@property(nonatomic,strong)LzgLabel *cellBriefContent;
@property(nonatomic,strong)UIImageView *img_1;
@property(nonatomic,strong)UIImageView *img_2;
@property(nonatomic,strong)UIImageView *img_3;
@property(nonatomic,strong)UIButton *blockingNews;
@property(nonatomic,strong)UIButton *likesBtn;
@property(nonatomic,strong)UIButton *bbiewDetailsBtn;
@end
@implementation NewsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor=UIColor.clearColor;
        self.backgroundColor=UIColor.clearColor;
        //
        _baseMentview=[[UIView alloc]init];
        _baseMentview.backgroundColor=UIColor.whiteColor;
        _baseMentview.layer.cornerRadius=10;
//        _baseMentview.clipsToBounds=YES;
        //
        _baseMentview.layer.shadowColor=UIColor.lightGrayColor.CGColor;
        _baseMentview.layer.shadowOffset=CGSizeMake(0,0);
        _baseMentview.layer.shadowRadius=5;
        _baseMentview.layer.shadowOpacity=0.7;
        
        //
        _cellTitle=[[UILabel alloc]init];
        _cellTitle.font=[UIFont fontWithName:@"AmericanTypewriter-Bold" size:12];
        //
        _cellBriefContent=[[LzgLabel alloc]init];
        _cellBriefContent.textColor=UIColor.lightGrayColor;
        _cellBriefContent.numberOfLines=0;
        _cellBriefContent.lineBreakMode=NSLineBreakByTruncatingTail;
        _cellBriefContent.font=[UIFont fontWithName:@"AmericanTypewriter" size:10];
        //
        _img_1=[[UIImageView alloc]init];
        
        _img_2=[[UIImageView alloc]init];
        _img_3=[[UIImageView alloc]init];
        for (UIImageView *obj in @[_img_1,_img_2,_img_3])
        {
            obj.contentMode=UIViewContentModeScaleAspectFit;
        }
        //
        //
        _blockingNews=[[UIButton alloc]init];
        [_blockingNews setImage:[UIImage imageNamed:@"5_153"] forState:UIControlStateNormal];
        _blockingNews.imageView.contentMode=UIViewContentModeScaleAspectFit;
        //
        //
        _likesBtn=[[UIButton alloc]init];
        _likesBtn.imageView.contentMode=_blockingNews.imageView.contentMode;
        [_likesBtn setImage:[UIImage imageNamed:@"5_161"] forState:UIControlStateNormal];
        [_likesBtn setImage:[UIImage imageNamed:@"5_156"] forState:UIControlStateSelected];
        ////
        ////
        ///
        _biewDetailsBtn=[[UIButton alloc]init];
        _biewDetailsBtn.imageView.contentMode=_blockingNews.imageView.contentMode;
        [_biewDetailsBtn setImage:[UIImage imageNamed:@"5_157"] forState:UIControlStateNormal];
        [self.contentView addSubview:_baseMentview];
        ///
        ////
        [_baseMentview sd_addSubviews:@[_cellTitle,_cellBriefContent,_img_1,_img_2,_img_3,_blockingNews,_likesBtn,_biewDetailsBtn]];
        [self p_setUPUI];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)p_setUPUI
{
    _baseMentview.sd_layout
    .leftSpaceToView(self.contentView, 20*LZGWIDTH)
    .topSpaceToView(self.contentView, 5*LZGHEIGHT)
    .heightIs(220*LZGHEIGHT)
    .rightSpaceToView(self.contentView, 20*LZGHEIGHT);
    //
    //
    _cellTitle.sd_layout
    .leftSpaceToView(_baseMentview, 10*LZGWIDTH)
    .topSpaceToView(_baseMentview, 2*LZGHEIGHT)
    .heightIs(12*LZGHEIGHT);
    [_cellTitle setSingleLineAutoResizeWithMaxWidth:_baseMentview.width];
    //
    _cellBriefContent.sd_layout
    .leftEqualToView(_cellTitle)
    .rightSpaceToView(_baseMentview, 10*LZGWIDTH)
    .heightIs(80*LZGHEIGHT)
    .topSpaceToView(_cellTitle, 2*LZGHEIGHT);
    //
    
    //
    
    _img_1.sd_layout
    .leftEqualToView(_cellBriefContent)
    .topSpaceToView(_cellBriefContent, 10*LZGHEIGHT)
    .heightIs(50*LZGHEIGHT)
    .widthIs(65*LZGWIDTH);
    
    _img_2.sd_layout
    .leftSpaceToView(_img_1, 5*LZGWIDTH)
    .centerYEqualToView(_img_1)
    .widthRatioToView(_img_1, 1)
    .heightRatioToView(_img_1, 1);
    //
    _img_3.sd_layout
    .leftSpaceToView(_img_2, 5*LZGWIDTH)
    .centerYEqualToView(_img_2)
    .heightRatioToView(_img_2, 1)
    .widthRatioToView(_img_2, 1);
    //
    _blockingNews.sd_layout
    .bottomSpaceToView(_baseMentview, 10*LZGHEIGHT)
    .leftEqualToView(_cellTitle)
    .heightIs(25*LZGHEIGHT)
    .widthIs(150*LZGWIDTH);
    //
    //
    _likesBtn.sd_layout
    .leftSpaceToView(_blockingNews, 10*LZGWIDTH)
    .centerYEqualToView(_blockingNews)
    .heightRatioToView(_blockingNews, 1)
    .widthIs(80*LZGWIDTH);
    //
    _biewDetailsBtn.sd_layout
    .leftSpaceToView(_likesBtn, 0)
    .centerYEqualToView(_likesBtn)
    .rightSpaceToView(_baseMentview, 1*LZGWIDTH)
    .heightRatioToView(_likesBtn, 1);
    [self setupAutoHeightWithBottomView:_baseMentview bottomMargin:10*LZGHEIGHT];
}
-(void)setDelegate:(id<NewsTableViewCellButtonDelegate>)delegate
{
    _delegate=delegate;
    if ([delegate conformsToProtocol:@protocol(NewsTableViewCellButtonDelegate) ])
    {
        /*
         -(void)NewsTableViewCellLikeButtonTargetActionMethod:(UIButton *)sender;
         -(void)NewsTableViewCellViewDetailsTargetActionMethod:(UIButton *)sender;
         -(void)NewsTableViewCellBlockingTargetActionMethod:(UIButton *)sender;

         **/
        if ([_delegate respondsToSelector:@selector(NewsTableViewCellBlockingTargetActionMethod:)])
        {
             [self.blockingNews addTarget:_delegate action:@selector(NewsTableViewCellBlockingTargetActionMethod:) forControlEvents:UIControlEventTouchUpInside];
        }
        if ([_delegate respondsToSelector:@selector(NewsTableViewCellLikeButtonTargetActionMethod:)])
        {
             [self.likesBtn addTarget:_delegate action:@selector(NewsTableViewCellLikeButtonTargetActionMethod:) forControlEvents:UIControlEventTouchUpInside];
        }
        if ([_delegate respondsToSelector:@selector(NewsTableViewCellViewDetailsTargetActionMethod:)])
        {
             [self.biewDetailsBtn addTarget:_delegate action:@selector(NewsTableViewCellViewDetailsTargetActionMethod:) forControlEvents:UIControlEventTouchUpInside];
        }
       
       
       
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
