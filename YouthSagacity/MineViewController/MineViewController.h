//
//  MineViewController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgScroBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineViewController : LzgScroBaseViewController
@property(nonatomic,readonly)UIImageView *topimg;
@property(nonatomic,readonly)UIImageView *portrait;
@property(nonatomic,readonly)UILabel *userName;
@property(nonatomic,readonly)UILabel *idLabel;
@property(nonatomic,readonly)UIImageView *likesLabel;
@property(nonatomic,readonly)UICollectionView *likesContent;
@property(nonatomic,readonly)UIImageView *messageLabel;
@property(nonatomic,readonly)UITableView *messagetableView;
@property(nonatomic,readonly)UITableView *menu;
@end

NS_ASSUME_NONNULL_END
