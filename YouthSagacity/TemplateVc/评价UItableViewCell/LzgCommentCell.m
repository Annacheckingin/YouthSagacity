//
//  LzgCommentCell.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgCommentCell.h"
@interface LzgCommentCell ()
{
    @protected
    UIImageView *_baseWhite;
}
@property(nonatomic,strong) UIImageView *baseWhite;
@end
@implementation LzgCommentCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _portrait=[[UIImageView alloc]init];
        _userName=[[UILabel alloc]init];
        _content=[[UILabel alloc]init];
        [self.contentView sd_addSubviews:@[_portrait,_userName,_content]];
        //
        _portrait.sd_layout
        .leftSpaceToView(self.contentView, 5*LZGWIDTH)
        .topSpaceToView(self.contentView, 2*LZGHEIGHT)
        .widthIs(20*LZGWIDTH)
        .heightEqualToWidth();
        //
        _content.sd_layout
        .leftSpaceToView(_portrait, 2*LZGWIDTH)
        ;
    }
    return self;
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
