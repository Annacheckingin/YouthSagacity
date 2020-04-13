//
//  LzgMessageCell.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/11.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LzgMessageCellDelegate <NSObject>

-(void)LzgMessageCellReplyAction:(UIButton *)sender;
-(void)LzgMessageCellDeletteAction:(UIButton *)sender;

@end
@interface LzgMessageCell : UITableViewCell
@property(nonatomic,readonly)UIImageView *portrait;
@property(nonatomic,readonly)UILabel *userName;
@property(nonatomic,readonly)UILabel *message;
@property(nonatomic,readonly)UIButton *reply;
@property(nonatomic,readonly)UIButton *deleteMesage;
@property(nonatomic,weak)id <LzgMessageCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
