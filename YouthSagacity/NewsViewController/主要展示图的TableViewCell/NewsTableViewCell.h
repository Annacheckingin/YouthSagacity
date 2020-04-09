//
//  NewsTableViewCell.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LzgLabel;
@interface NewsTableViewCell : UITableViewCell
@property(nonatomic,readonly)UIView *baseMentview;
@property(nonatomic,readonly)UILabel *cellTitle;
@property(nonatomic,readonly)LzgLabel *cellBriefContent;
@property(nonatomic,readonly)UIImageView *img_1;
@property(nonatomic,readonly)UIImageView *img_2;
@property(nonatomic,readonly)UIImageView *img_3;
@property(nonatomic,readonly)UIButton *blockingNews;
@property(nonatomic,readonly)UIButton *likesBtn;
@property(nonatomic,readonly)UIButton *biewDetailsBtn;
@end

NS_ASSUME_NONNULL_END
