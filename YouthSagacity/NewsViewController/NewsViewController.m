//
//  NewsViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "LzgImageCollectionCell.h"
#import "LzgSandBoxStore.h"
#import "LzgLabel.h"
#define kLzgTopCollectionViewHeight 150
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
@interface NewsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *headImages;
@property(nonatomic,strong)NSMutableArray *tableViewData;
@property(nonatomic,assign)BOOL kfreshed;
@end

@implementation NewsViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;

    if (_kfreshed)
    {
        [self kRefreshData];
    }
}
-(void)kRefreshData
{
   
    NSString *pathOfDocumentDirectory=[[LzgSandBoxStore shareInstance] stringForSandBoxOfDocument];
    NSString *nameOfPlistFile=[pathOfDocumentDirectory stringByAppendingString:@"/FixedData.plist"];
    NSDictionary *dicOfNewsData=[NSDictionary dictionaryWithContentsOfFile:nameOfPlistFile];
    
    _tableViewData=dicOfNewsData[@"NewsViewController"][@"NewsTableViewCell"];
    NSLog(@"%@",dicOfNewsData[@"NewsViewController"]);
    NSLog(@"%@",_tableViewData);
    _kfreshed=NO;
}
-(instancetype)init
{
    if(self=[super init])
    {
        _kfreshed=YES;
        _headImages=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"5_71"],[UIImage imageNamed:@"5_73"],[UIImage imageNamed:@"5_115"], nil];
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
//        flowLayout.minimumLineSpacing=-((SCREENWIDTH-2*40*LZGWIDTH)/2-(SCREENWIDTH-2*40*LZGWIDTH)*0.8*0.2);
        flowLayout.minimumLineSpacing=20*LZGWIDTH;
        flowLayout.sectionInset=UIEdgeInsetsMake(0, 20*LZGWIDTH, 0, 20*LZGWIDTH);
        flowLayout.itemSize=CGSizeMake(SCREENWIDTH-40*LZGWIDTH, kLzgTopCollectionViewHeight*LZGHEIGHT);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        _topShow=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_topShow registerClass:[LzgImageCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([LzgImageCollectionCell class])];
//        [_topShow setCollectionViewLayout:flowLayout];
        _topShow.delegate=self;
        _topShow.dataSource=self;
        _topShow.backgroundColor=UIColor.clearColor;
        _mainDisplay=[[UITableView alloc]init];
        _mainDisplay.delegate=self;
        _mainDisplay.dataSource=self;
        _mainDisplay.separatorStyle=UITableViewCellSeparatorStyleNone;
        _mainDisplay.backgroundColor=UIColor.clearColor;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseScroView.backgroundColor=kBackGroundColor;
    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, SCREENHEIGHT)];
    [self.baseScroView addSubview:_topShow];
    [self.baseScroView addSubview:_mainDisplay];
    [self p_setUpUI];

    // Do any additional setup after loading the view.
}
-(void)p_setUpUI
{
    _topShow.sd_layout
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .topEqualToView(self.baseScroView).offset(10*LZGHEIGHT)
    .heightIs(kLzgTopCollectionViewHeight*LZGHEIGHT);
    //
     _mainDisplay.sd_layout
    .leftEqualToView(_topShow)
    .rightEqualToView(_topShow)
    .bottomEqualToView(self.baseScroView)
    .topSpaceToView(_topShow, 10*LZGHEIGHT);
    //
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark UIcollectionViewDelegate/datasource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    LzgImageCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LzgImageCollectionCell class]) forIndexPath:indexPath];
    NSInteger indexOfImagesArray = 0;
    switch (indexPath.row) {
            case 0:
            indexOfImagesArray=indexPath.row;
            break;
            case 1:
            indexOfImagesArray=indexPath.row;
            break;
            case 2:
            indexOfImagesArray=indexPath.row;
            break;
    }
    
    UIImage *displayImage=_headImages[indexOfImagesArray];
    [cell.imageView setImage:displayImage];
    return cell;
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.headImages.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
#pragma mark UItableViewDelegate/datasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_mainDisplay cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:_mainDisplay];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsTableViewCell class])];
    if (cell==nil)
    {
        cell=[[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([NewsTableViewCell class])];
    }
    NSDictionary *curentData=[_tableViewData objectAtIndex:indexPath.section];
    cell.cellTitle.text=curentData[@"articleTitle"];
    cell.cellBriefContent.text=curentData[@"content"];
    [cell.img_1 yy_setImageWithURL:curentData[@"image_1"] placeholder:[UIImage imageNamed:@"bitmap"]];
    [cell.img_2 yy_setImageWithURL:curentData[@"image_2"] placeholder:[UIImage imageNamed:@"bitmap"]];
    [cell.img_3 yy_setImageWithURL:curentData[@"image_3"] placeholder:[UIImage imageNamed:@"bitmap"]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%ld",_tableViewData.count);
    return _tableViewData.count;
}







@end
