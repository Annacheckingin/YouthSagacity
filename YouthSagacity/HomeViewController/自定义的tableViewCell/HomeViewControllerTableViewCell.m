//
//  HomeViewControllerTableViewCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "HomeViewControllerTableViewCell.h"
@interface HomeViewControllerTableViewCell ()
@property(nonatomic,strong)UIView *kBackgroundView;
@property(nonatomic,strong)UIImageView *kCellRightImageView;
-(void)kSetUpUI;
-(void)kSetUpUIWithBaseMentView:(UIView *)basementView;
@end
@implementation HomeViewControllerTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor=UIColor.clearColor;
        self.backgroundColor=UIColor.clearColor;
        _kBackgroundView=[[UIView alloc]init];
        _kBackgroundView.backgroundColor=UIColor.whiteColor;
        _kBackgroundView.layer.borderColor=UIColor.lightGrayColor.CGColor;
        _kBackgroundView.layer.borderWidth=0.2;
        _kBackgroundView.layer.cornerRadius=5;
        _kBackgroundView.clipsToBounds=YES;
        _kCellRightImageView=[[UIImageView alloc]init];
        _kCellRightImageView.layer.cornerRadius=_kBackgroundView.layer.cornerRadius;
        _kCellRightImageView.clipsToBounds=YES;
        //
        _cellTitle=[[UILabel alloc]init];
        _cellTitle.lineBreakMode=NSLineBreakByTruncatingTail;
        _cellTitle.font=[UIFont systemFontOfSize:6];
        //
        _cellBriefContent=[[UILabel alloc]init];
        _cellBriefContent.textColor=UIColor.lightGrayColor;
        _cellBriefContent.font=[UIFont fontWithName:@"ArialMT" size:9];
        _cellBriefContent.lineBreakMode=NSLineBreakByTruncatingTail;
        //
        _chatBtn=[[UIButton alloc]init];
        [_chatBtn setImage:[UIImage imageNamed:@"5_120"] forState:UIControlStateNormal];
         
        _chatBtn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _detailBtn=[[UIButton alloc]init];
        [_detailBtn setImage:[UIImage imageNamed:@"5_121"] forState:UIControlStateNormal];
        _detailBtn.imageView.contentMode=_chatBtn.imageView.contentMode;
        
        //
//        _cellBriefContent=[[UILabel alloc]init];
//        _cellBriefContent.textColor=UIColor.lightGrayColor;
//        _cellBriefContent.lineBreakMode=NSLineBreakByTruncatingTail;
        //
        
    }
    [self kSetUpUI];
    return self;
}
-(void)setDelegate:(id<HomeViewControllerTableViewCellDelegate>)delegate
{
    _delegate=delegate;
    if ([delegate conformsToProtocol:@protocol(HomeViewControllerTableViewCellDelegate)])
    {
        [_chatBtn addTarget:_delegate action:@selector(HomeViewControllerTableViewCellTheTargetActionMethodOfChatBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_detailBtn addTarget:_delegate action:@selector(HomeViewControllerTableViewCellTheTargetActionMethodOfDetailBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)kSetUpUI
{
    [self.contentView sd_addSubviews:@[_kBackgroundView]];
    [self addSubview:_kCellRightImageView];
    //
     _kBackgroundView.sd_layout
    .leftSpaceToView(self.contentView, 15*LZGWIDTH)
#pragma mark 底部View的上方间隔
    .topSpaceToView(self.contentView, 5*LZGHEIGHT)
    .rightSpaceToView(self.contentView, 50*LZGWIDTH)
    .heightIs(100*LZGHEIGHT);
    //
    _kCellRightImageView.sd_layout
    .topSpaceToView(self, 30*LZGHEIGHT)
    .rightSpaceToView(self, 20*LZGWIDTH)
    .heightIs(40*LZGHEIGHT)
    .widthIs(80*LZGWIDTH);
    [self kSetUpUIWithBaseMentView:_kBackgroundView];
    //
    
}
-(void)kSetUpUIWithBaseMentView:(UIView *)basementView
{
    _cellTitle.sd_layout
    .leftSpaceToView(basementView, 5*LZGWIDTH)
#pragma mark celltitle的上方间隔
    .topSpaceToView(basementView, 8*LZGHEIGHT)
    .heightIs(6*LZGHEIGHT)
    .widthIs(SCREENWIDTH-15*LZGWIDTH-100*LZGWIDTH);
    //
    _cellBriefContent.sd_layout
    .leftEqualToView(_cellTitle)
    .rightEqualToView(_cellTitle)
#pragma mark cell内容的上方间隔
    .topSpaceToView(_cellTitle, 2*LZGHEIGHT)
#pragma mark 基础view减去间隔数和下方两个按钮的高度加上按钮和下面的间隔
    .heightIs(100*LZGHEIGHT-(2+8+5)*LZGHEIGHT-50*LZGWIDTH-10*LZGHEIGHT);
    //
    //
    _chatBtn.sd_layout
    .topSpaceToView(_cellBriefContent, 10*LZGHEIGHT)
    .leftEqualToView(_cellBriefContent)
    .widthIs(60*LZGWIDTH)
    .heightIs(20*LZGHEIGHT)
    ;
    //
    _detailBtn.sd_layout
    .leftSpaceToView(_chatBtn, 0)
    .centerYEqualToView(_chatBtn)
    .heightRatioToView(_chatBtn, 1);
    [self setupAutoHeightWithBottomView:_kBackgroundView bottomMargin:5*LZGHEIGHT];
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
