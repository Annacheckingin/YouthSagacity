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
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout>
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
    NSString *stringOfPlistFile=[stringOFdocumentPath stringByAppendingString:@"/FixedData"];
    //
    NSMutableDictionary *dictotalData=[[NSMutableDictionary alloc]initWithContentsOfFile:stringOfPlistFile];
    NSMutableDictionary *HomeVc=dictotalData[@"HomeViewController"];
    NSMutableArray *collectionViewData=HomeVc[@"homeCollectionVIewCell"];
    _collectionViewCellInfor=collectionViewData;
    //
    NSMutableArray *tableViewData=HomeVc[@""];
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
        _freshedData=NO;
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
        _tips=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.tips registerClass:[HomeViewControllerCollectionVIewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionVIewCell class])];
        _tips.delegate=self;
        _tips.dataSource=self;
        //
        _projectsLabel=[[UILabel alloc]init];
        _projectsLabel.text=@"Beginner project works";
        _projectsLabel.font=_tipsLabel.font;
#pragma mark TableView
        _projects=[[UITableView alloc]init];
        _projects.delegate=self;
        _projects.dataSource=self;
      
    }
    return self;
}
- (void)viewDidLoad
{
    
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
    accumulateHeight+=50;
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
    .heightIs(150*LZGHEIGHT);
    accumulateHeight+=160;
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
#pragma mark UItableView布局
    //
    if (accumulateHeight*LZGHEIGHT<SCREENHEIGHT)
       {
           accumulateHeight=SCREENHEIGHT;
       }
    //
    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, accumulateHeight*LZGHEIGHT)];
    _projects.sd_layout
    .topSpaceToView(_projectsLabel, 5*LZGHEIGHT)
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .bottomEqualToView(self.baseScroView);
    //
    
   
    
    // Do any additional setup after loading the view.
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark UITableViewDatasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}
//
#pragma mark UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark UICollectionViewDatasource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeViewControllerCollectionVIewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionVIewCell class]) forIndexPath:indexPath];
    if (cell==nil)
    {
        cell=[[HomeViewControllerCollectionVIewCell alloc]initWithFrame:CGRectZero];
    }
    
    
    

    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}
#pragma mark UICollectionViewFowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeZero;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
