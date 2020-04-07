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
        _cellContent=[[UILabel alloc]init];
        _cellTailPoint=[[UIImageView alloc]init];
    }
    [self.contentView sd_addSubviews:@[_cellPortarite,_cellContent,_cellTailPoint]];
    _cellPortarite.sd_layout
    .leftSpaceToView(self.contentView, 10*LZGWIDTH)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .widthEqualToHeight();
    //
    _cellTailPoint.sd_layout
    .rightSpaceToView(self.contentView, 10*LZGWIDTH)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .widthEqualToHeight();
    //
    
    _cellContent.sd_layout
    .leftSpaceToView(_cellPortarite, 5*LZGWIDTH)
    .heightRatioToView(_cellPortarite, 1)
    .centerYEqualToView(_cellPortarite);
    [_cellContent setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH-_cellContent.width];
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
