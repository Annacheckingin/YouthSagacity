//
//  NewsViewController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgScroBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsViewController : LzgScroBaseViewController
@property(nonatomic,strong)UICollectionView *topShow;
@property(nonatomic,strong)UITableView *mainDisplay; 
@end

NS_ASSUME_NONNULL_END
