//
//  LzgMessageCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/11.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMessageCell.h"
@interface LzgMessageCell ()
@property(nonatomic,strong)UIView *kBaseView;

@end
@implementation LzgMessageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    /*
     @property(nonatomic,readonly)UIImageView *portrait;
     @property(nonatomic,readonly)UILabel *userName;
     @property(nonatomic,readonly)UILabel *message;
     @property(nonatomic,readonly)UIButton *reply;
     @property(nonatomic,readonly)UIButton *deleteMesage;
     **/
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _kBaseView=[[UIView alloc]init];
#warning 测试
        _kBaseView.backgroundColor=UIColor.whiteColor;
        _kBaseView.layer.cornerRadius=5;
        _kBaseView.clipsToBounds=YES;
        _portrait=[[UIImageView alloc]init];
        _userName=[[UILabel alloc]init];
        _userName.font=[UIFont fontWithName:@"ArialRoundedMTBold" size:18];
        _message=[[UILabel alloc]init];
        _message.font=[UIFont fontWithName:@"Courier" size:16];
        _reply=[[UIButton alloc]init];
        [_reply setImage:[UIImage imageNamed:@"5_66"] forState:UIControlStateNormal];
        _reply.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _deleteMesage=[[UIButton alloc]init];
        [_deleteMesage setImage:[UIImage imageNamed:@"5_64"] forState:UIControlStateNormal];
        _deleteMesage.imageView.contentMode=_reply.imageView.contentMode;
    }
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor=UIColor.clearColor;
    self.backgroundColor=UIColor.clearColor;
    [self p_setUi];
    return self;
}
-(void)p_setUi
{
    [self.contentView sd_addSubviews:@[_kBaseView,_reply,_deleteMesage]];
    _kBaseView.sd_layout.leftSpaceToView(self.contentView, 10*LZGWIDTH)
    .rightSpaceToView(self.contentView, 10*LZGHEIGHT)
    .topSpaceToView(self.contentView, 2*LZGHEIGHT)
    .heightIs(80*LZGHEIGHT);
   
    //
    [self p_baseMentViewsetUi];
}
-(void)p_baseMentViewsetUi
{
    [_kBaseView sd_addSubviews:@[_portrait,_userName,_message]];
    
    
    _portrait.sd_layout
    .leftSpaceToView(_kBaseView, 5*LZGWIDTH)
    .topSpaceToView(_kBaseView, 5*LZGHEIGHT)
    .widthIs(20*LZGWIDTH)
    .heightEqualToWidth();
    //
    _userName.sd_layout
    .leftSpaceToView(_portrait, 2*LZGWIDTH)
    .centerYEqualToView(_portrait)
    .heightRatioToView(_portrait, 1);
    [_userName setSingleLineAutoResizeWithMaxWidth:200];
    //
    //
    _message.sd_layout
    .leftEqualToView(_portrait)
    .heightIs(30*LZGHEIGHT)
    .topSpaceToView(_userName, 10*LZGHEIGHT);
    [_message setSingleLineAutoResizeWithMaxWidth:200];
    //
    ;
    _reply.sd_layout
    .rightSpaceToView(self.contentView, 10*LZGHEIGHT)
    .topSpaceToView(_kBaseView, 10*LZGHEIGHT)
    .heightIs(20*LZGHEIGHT)
    .widthIs(100*LZGWIDTH);
    //
    _deleteMesage.sd_layout
    .rightSpaceToView(_reply, 20*LZGWIDTH)
    .centerYEqualToView(_reply)
    .heightRatioToView(_reply, 1)
    .widthRatioToView(_reply, 1)
    ;
     [self setupAutoHeightWithBottomView:_reply bottomMargin:10*LZGHEIGHT];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setDelegate:(id<LzgMessageCellDelegate>)delegate
{
    _delegate=delegate;
    if ([_delegate conformsToProtocol:@protocol(LzgMessageCellDelegate) ])
    {
        [_deleteMesage  addTarget:_delegate action:@selector(LzgMessageCellDeletteAction:) forControlEvents:UIControlEventTouchUpInside];
        [_reply addTarget:_delegate action:@selector(LzgMessageCellReplyAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}
@end
