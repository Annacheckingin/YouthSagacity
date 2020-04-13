//
//  HomeViewController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgScroBaseViewController.h"
@class LzgTableView;
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : LzgScroBaseViewController
@property(nonatomic,strong)UILabel *headLine;
@property(nonatomic,strong)UIButton *goForPublish;
@property(nonatomic,strong)UILabel *tipsLabel;
@property(nonatomic,strong)UICollectionView *tips;
@property(nonatomic,strong)UILabel *projectsLabel;
@property(nonatomic,strong) LzgTableView*projects;

@end

NS_ASSUME_NONNULL_END
