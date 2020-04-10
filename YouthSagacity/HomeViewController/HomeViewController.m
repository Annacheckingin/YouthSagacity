//
//  HomeViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewControllerCollectionVIewCell.h"
#import "LzgSandBoxStore.h"
#import "UIButton+LzgBelongtoCell.h"
#import "HomeViewControllerTableViewCell.h"
#import "LzgDetailsViewController.h"
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,HomeViewControllerCollectionVIewCellDelegate>
@property(nonatomic,strong)NSMutableArray *collectionViewCellInfor;
@property(nonatomic,strong)NSMutableArray *tableViewCellInfor;
@property(nonatomic,assign) BOOL freshedData;
@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
    if (_freshedData)
    {
        [self kHomeViewControllerShowData];
    }
    
}
-(void)kHomeViewControllerShowData
{
  
    NSString *stringOFdocumentPath=[[LzgSandBoxStore shareInstance] stringForSandBoxOfDocument];
    NSString *stringOfPlistFile=[stringOFdocumentPath stringByAppendingString:@"/FixedData.plist"];
    //
    NSMutableDictionary *dictotalData=[[NSMutableDictionary alloc]initWithContentsOfFile:stringOfPlistFile];
    NSMutableDictionary *HomeVc=dictotalData[@"HomeViewController"];
    NSMutableArray *collectionViewData=HomeVc[@"homeCollectionVIewCell"];
    _collectionViewCellInfor=collectionViewData;
    //
    NSMutableArray *tableViewData=HomeVc[@"homeTableView"];
    _tableViewCellInfor=tableViewData;
    [self.tips reloadData];
    [self.projects reloadData];
    _freshedData=NO;
}
-(instancetype)init
{
    if (self=[super init])
    {
        /*
         @property(nonatomic,strong)UILabel *headLine;
         @property(nonatomic,strong)UIButton *goForPublish;
         @property(nonatomic,strong)UILabel *tipsLabel;
         @property(nonatomic,strong)UICollectionView *tips;
         @property(nonatomic,strong)UILabel *projectsLabel;
         @property(nonatomic,strong)UITableView *projects;
         **/
        _freshedData=YES;
        _headLine=[[UILabel alloc]init];
        _headLine.text=@"BeadWork";
        _headLine.font=[UIFont fontWithName:@"CourierNewPS-BoldMT" size:15];
        _goForPublish=[[UIButton alloc]init];
        [_goForPublish setImage:[UIImage imageNamed:@"realgofor"] forState:UIControlStateNormal];
        _goForPublish.imageView.contentMode=UIViewContentModeScaleAspectFill;
        _tipsLabel=[[UILabel alloc]init];
        _tipsLabel.text=@"BeadWork Tips";
        _tipsLabel.font=[UIFont fontWithName:@"Courier" size:12];
        //
#pragma mark CollectionView
         UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing=10*LZGWIDTH;
        flowLayout.sectionInset=UIEdgeInsetsMake(5, 10, 5, 10);
        flowLayout.itemSize=CGSizeMake(200*LZGHEIGHT, 200*LZGHEIGHT);
        _tips=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _tips.backgroundColor=UIColor.clearColor;
        _tips.showsHorizontalScrollIndicator=NO;
        [self.tips registerClass:[HomeViewControllerCollectionVIewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionVIewCell class])];
        _tips.delegate=self;
        _tips.dataSource=self;
        //
        _projectsLabel=[[UILabel alloc]init];
        _projectsLabel.text=@"Beginner project works";
        _projectsLabel.font=_tipsLabel.font;
#pragma mark TableView
        _projects=[[UITableView alloc]init];
        _projects.backgroundColor=UIColor.clearColor;
        _projects.delegate=self;
        _projects.dataSource=self;
        _projects.separatorStyle=UITableViewCellSeparatorStyleNone;
      
    }
    return self;
}
- (void)viewDidLoad
{
    _freshedData=YES;
    [super viewDidLoad];
    self.view.backgroundColor=kBackGroundColor;
    [self.baseScroView sd_addSubviews:@[_headLine,_goForPublish ,_tipsLabel,_tips,_projectsLabel,_projects]];
//    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, SCREENHEIGHT*1.2)];
    static float accumulateHeight=0;
    _headLine
    .sd_layout
#pragma mark 上方间隔
    .leftSpaceToView(self.baseScroView,  20*LZGWIDTH)
    .topSpaceToView(self.baseScroView, 40*LZGHEIGHT)
    .widthIs(80*LZGWIDTH)
#pragma mark 高度
    .heightIs(30*LZGHEIGHT);
    accumulateHeight+=70;
    //
     
    _goForPublish
    .sd_layout.leftEqualToView(_headLine)
#pragma mark 上方间隔
    .topSpaceToView(_headLine, 10*LZGHEIGHT)
    .rightSpaceToView(self.baseScroView, 20*LZGWIDTH)
#pragma mark 高度
    .heightIs(40*LZGHEIGHT);
    //
    accumulateHeight+=50;
    //
    _tipsLabel.sd_layout
     .leftEqualToView( _headLine)
#pragma mark 上方间隔
    .topSpaceToView(_goForPublish, 10*LZGHEIGHT)
#pragma mark 高度
    .heightIs(15);
    accumulateHeight+=25;
    [_tipsLabel setSingleLineAutoResizeWithMaxWidth:100];
#pragma mark CollectionnView布局
    //
    _tips.sd_layout
    .leftEqualToView(_headLine)
    .rightSpaceToView(self.baseScroView, 20*LZGWIDTH)
#pragma mark 上方间隔
    .topSpaceToView(_tipsLabel, 10*LZGHEIGHT)
#pragma mark 高度
    .heightIs(200*LZGHEIGHT);
    accumulateHeight+=210;
    //
    _projectsLabel.sd_layout
    .leftEqualToView(_headLine)
#pragma mark 上方间隔
    .topSpaceToView(_tips, 20*LZGHEIGHT)
#pragma mark 高度
    .heightIs(15*LZGHEIGHT);
    accumulateHeight+=35;
    [_projectsLabel setSingleLineAutoResizeWithMaxWidth:200];
    //

    //
    CGFloat heightOfTableView=250.0;
    accumulateHeight+=heightOfTableView+5;
    if (accumulateHeight<SCREENHEIGHT)
       {
           
           accumulateHeight=SCREENHEIGHT;
       }
    //
    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, accumulateHeight)];
    
    //
#pragma mark UItableView布局
     _projects.sd_layout.
     topSpaceToView(_projectsLabel, 5*LZGHEIGHT)
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .heightIs(heightOfTableView*LZGHEIGHT);
     
    // Do any additional setup after loading the view.
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
#pragma mark UITableViewDatasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewControllerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeViewControllerTableViewCell class])];
    if (cell==nil)
    {
        cell=[[HomeViewControllerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([HomeViewControllerTableViewCell class])];
    }
    
    NSDictionary *dictionary=[_tableViewCellInfor objectAtIndex:indexPath.section];
    cell.cellTitle.text=dictionary[@"articleTitle"];
    cell.cellBriefContent.text=dictionary[@"breifContent"];
    [cell setTheCellDisplayImage:dictionary[@"img"]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableViewCellInfor.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:tableView];
}
//
#pragma mark UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LzgDetailsViewController *detailsVc=[[LzgDetailsViewController alloc]init];
       [self.navigationController pushViewController:detailsVc animated:YES];
}
#pragma mark UICollectionViewDatasource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewControllerCollectionVIewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionVIewCell class]) forIndexPath:indexPath];
    NSDictionary *inforDic=[self.collectionViewCellInfor objectAtIndex:indexPath.row];
    cell.delegate=self;
    cell.cellTitle.textColor=UIColor.blackColor;
    cell.cellDate.text=inforDic[@"date"];
    cell.cellTitle.text=[inforDic objectForKey:@"articleTitle"];
    [cell.cellImage yy_setImageWithURL:inforDic[@"image"] placeholder:[UIImage imageNamed:@"bitmap"]];
    cell.cellAuthor.text=inforDic[@"author"];
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectionViewCellInfor.count;
}
#pragma mark UICollectionViewFowLayoutDelegate
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(100*LZGWIDTH, 100*LZGHEIGHT);
//}


- (void)HomeViewControllerCollectionVIewCellForBideTargetActionMethod:(nonnull UIButton *)sender
{
    UICollectionViewCell *belongtoCell=sender.belongto;
    
    
    
    
    
}

- (void)HomeViewControllerCollectionVIewCellViewDetailsTargetActionMethod:(nonnull UIButton *)sender
{
    NSLog(@"ok");
    UICollectionViewCell *belongtoCell=sender.belongto;
    NSIndexPath *indexPath=[_tips indexPathForCell:belongtoCell];
    [self collectionView:_tips didSelectItemAtIndexPath:indexPath];
}

- (void)HomeViewControllerCollectionVIewCellWarningTargetActionMethod:(nonnull UIButton *)sender
{
    UICollectionViewCell *belongtoCell=sender.belongto;
       
}


@end
