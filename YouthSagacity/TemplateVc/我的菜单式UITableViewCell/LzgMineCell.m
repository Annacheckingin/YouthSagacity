//
//  LzgMineCell.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMineCell.h"

@implementation LzgMineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _cellPortarite=[[UIImageView alloc]init];
        _cellPortarite.contentMode=UIViewContentModeScaleAspectFit;
        _cellContent=[[UILabel alloc]init];
        _cellTailPoint=[[UIImageView alloc]init];
        _cellTailPoint.contentMode=UIViewContentModeScaleAspectFit;
    }
    self.contentView.backgroundColor=UIColor.clearColor;
    self.backgroundColor=UIColor.clearColor;
    [self.contentView sd_addSubviews:@[_cellPortarite,_cellContent,_cellTailPoint]];
    _cellPortarite.sd_layout
    .leftSpaceToView(self.contentView, 20*LZGWIDTH)
    .centerYEqualToView(self.contentView)
    .heightIs(20*LZGHEIGHT)
    .widthEqualToHeight();
    //
    _cellTailPoint.sd_layout
    .rightSpaceToView(self.contentView, 10*LZGWIDTH)
    .centerYEqualToView(self.contentView)
    .heightIs(10*LZGHEIGHT)
    .widthEqualToHeight();
    //
    
    _cellContent.sd_layout
    .leftSpaceToView(_cellPortarite, 20*LZGWIDTH)
    .heightRatioToView(_cellPortarite, 1)
    .centerYEqualToView(_cellPortarite);
    _cellContent.font=[UIFont fontWithName:@"AmericanTypewriter-Bold" size:18];
    //

    [self setupAutoHeightWithBottomViewsArray:@[_cellPortarite,_cellContent,_cellTailPoint] bottomMargin:10*LZGWIDTH];
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
