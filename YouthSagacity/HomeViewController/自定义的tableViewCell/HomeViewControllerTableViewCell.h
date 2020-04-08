//
//  HomeViewControllerTableViewCell.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomeViewControllerTableViewCellDelegate <NSObject>

-(void)HomeViewControllerTableViewCellTheTargetActionMethodOfChatBtn:(UIButton *)sender;
-(void)HomeViewControllerTableViewCellTheTargetActionMethodOfDetailBtn:(UIButton *)sender;

@end
@interface HomeViewControllerTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *cellTitle;
@property(nonatomic,strong)UILabel *cellBriefContent;
@property(nonatomic,strong)UIButton *chatBtn;
@property(nonatomic,strong)UIButton *detailBtn;
@property(nonatomic,weak) id<HomeViewControllerTableViewCellDelegate> delegate;
-(void)setTheCellDisplayImage:(id)imageSource;
@end

NS_ASSUME_NONNULL_END
