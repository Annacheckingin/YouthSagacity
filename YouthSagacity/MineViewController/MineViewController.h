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
@property(nonatomic,strong)UIImageView *topimg;
@property(nonatomic,strong)UIImageView *portrait;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *idLabel;
@property(nonatomic,strong)UIImageView *likesLabel;
@property(nonatomic,strong)UICollectionView *likesContent;
@property(nonatomic,strong)UIImageView *messageLabel;
@property(nonatomic,strong)UITableView *messagetableView;
@property(nonatomic,strong)UITableView *menu; 
@end

NS_ASSUME_NONNULL_END
