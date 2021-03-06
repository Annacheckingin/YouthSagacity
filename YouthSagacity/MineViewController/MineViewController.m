//
//  MineViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "MineViewController.h"
#import "LzgMenuDelegate.h"
#import "LzgMenuDataSource.h"
#import "LzgDevicePixlesHandle.h"
#import "LzgLikesModel.h"
#import "LzgMessageCenter.h"
#import "LzgLikesModel.h"
#import "LzgLogStatus.h"
#import "LzgMessageCell.h"
#import "LzgSandBoxStore.h"
#import "LzgMessageCenter.h"
#import "UIButton+LzgBelongtoCell.h"
#import "LzgScrollView.h"
#import "LzgLikeCollectionVIewCell.h"
#import "NewsDetailViewController.h"
#import "LzgLabel.h"
#import "UIButton+LzgBelongtoCell.h"
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
FOUNDATION_EXPORT const NSString *LzgLikesNotificationName=@"LzgLikesNotificationName";
@interface MineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,LzgMessageCellDelegate,NewsDetailViewControllerDelegate>
@property(nonatomic,strong)UIImage *yellowStar;
@property(nonatomic,strong)UIImageView *topimg;
@property(nonatomic,strong)UIImageView *portrait;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *idLabel;
@property(nonatomic,strong)UIImageView *likesLabel;
@property(nonatomic,strong)UICollectionView *likesContent;
@property(nonatomic,strong)UIImageView *messageLabel;
@property(nonatomic,strong)UITableView *messagetableView;
@property(nonatomic,strong)UITableView *menu;
@property(nonatomic,strong)UILabel *fixedDataLabel_Personal;
@property(nonatomic,strong)LzgMenuDelegate *menuDelegate;
@property(nonatomic,strong)LzgMenuDataSource *menuDataSource;
@property(nonatomic,strong)LzgLikesModel *likes;
@property(nonatomic,strong)LzgLikesModel *likesCenter;
@property(nonatomic,strong)LzgMessageCenter *messageCenter;
@property(nonatomic,strong)NSMutableArray *messageArray;
-(void)p_setupUI;
@end

@implementation MineViewController
-(LzgMenuDataSource *)menuDataSource
{
    if (_menuDataSource==nil)
    {
       
        _menuDataSource=[[LzgMenuDataSource alloc]init];
    }
    return _menuDataSource;
}
-(LzgMenuDelegate *)menuDelegate
{
    if (_menuDelegate==nil)
    {
     
        _menuDelegate=[[LzgMenuDelegate alloc]init];
    }
    return _menuDelegate;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
    
}
-(instancetype)init
{
    if (self=[super init])
    {
        /*
         @property(nonatomic,strong)UIImageView *topimg;
         @property(nonatomic,strong)UIImageView *portrait;
         @property(nonatomic,strong)UILabel *userName;
         @property(nonatomic,strong)UILabel *idLabel;
         @property(nonatomic,strong)UIImageView *likesLabel;
         @property(nonatomic,strong)UICollectionView *likesContent;
         @property(nonatomic,strong)UIImageView *messageLabel;
         @property(nonatomic,strong)UITableView *messagetableView;
         @property(nonatomic,strong)UITableView *menu;
         **/
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_handleAddLikeNotification:) name:LzgLikesNotificationName object:nil];
        LzgScrollView *sc=(LzgScrollView *)self.baseScroView;
        [sc setThekAllowDifferentGR:NO];
        _likesCenter=[LzgLikesModel shareInstance];
        _messageCenter=[LzgMessageCenter shareInstance];
        _likes=[LzgLikesModel shareInstance];
        self.baseScroView.backgroundColor=kBackGroundColor;
#pragma mark 固定搭配的声明信息
        _fixedDataLabel_Personal=[[UILabel alloc]init];
        _fixedDataLabel_Personal.text=@"Personal";
        _fixedDataLabel_Personal.textColor=UIColor.whiteColor;
        //
#pragma mark 上部背景图片
        _topimg=[[UIImageView alloc]init];
        _topimg.image=[UIImage imageNamed:@"5_125"];
        _topimg.contentMode=UIViewContentModeScaleAspectFill;
        _portrait=[[UIImageView alloc]init];
        _portrait.image=[UIImage imageNamed:@"5_13"];
        _userName=[[UILabel alloc]init];
        
#pragma mark 用户名
        _userName.text=@"unkown";
        _userName.textColor=UIColor.whiteColor;
        _userName.font=[UIFont fontWithName:@"Arial-BoldMT" size:18];
        _idLabel=[[UILabel alloc]init];
#pragma mark 用户id
        _idLabel.text=_userName.text;
        _idLabel.textColor=UIColor.whiteColor;
        _idLabel.font=[UIFont fontWithName:@"AppleGothic" size:8];
        _likesLabel=[[UIImageView alloc]init];
        _likesLabel.contentMode=UIViewContentModeScaleAspectFit;
        _likesLabel.image=[UIImage imageNamed:@"5_34"];
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        
        _likesContent=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _likesContent.bounces=YES;
        [_likesContent registerClass:[LzgLikeCollectionVIewCell class] forCellWithReuseIdentifier:NSStringFromClass([LzgLikeCollectionVIewCell class])];
#pragma mark collectionViewLayout的布局
        flowLayout.minimumLineSpacing=10;
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize=CGSizeMake(320*LZGWIDTH, 80*LZGHEIGHT);
        flowLayout.sectionInset=UIEdgeInsetsMake(5, 10, 5, 10);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        _likesContent.delegate=self;
        _likesContent.dataSource=self;
        _likesContent.backgroundColor=UIColor.clearColor;
        _messageLabel=[[UIImageView alloc]init];
        _messageLabel.contentMode=_likesLabel.contentMode;
        _messageLabel.image=[UIImage imageNamed:@"5_29"];
        _messagetableView=[[UITableView alloc]init];
        _messagetableView.delegate=self;
        _messagetableView.dataSource=self;
        _messagetableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _messagetableView.backgroundColor=UIColor.clearColor;
        
        _menu=[[UITableView alloc]init];
       _menu.delegate=self.menuDelegate;
       _menu.dataSource=self.menuDataSource;
        self.menuDelegate.belongto=self.menu;
        self.menuDataSource.belongto=self.menu;
//        _menu.scrollEnabled=NO;
        _menu.separatorStyle=UITableViewCellSeparatorStyleNone;
        _menu.backgroundColor=UIColor.clearColor;
        self.baseScroView.delegate=self;
#pragma mark 测试
    
#pragma mark UISroView
   
    }
    return self;
}
-(void)p_handleAddLikeNotification:(NSNotification *)noti
{
    NSDictionary *dic=noti.userInfo;
    LikesModel *model=[[LikesModel alloc]initWithTitile:dic[@"articleTitle"] content:dic[@"content"] image1:dic[@"image_1"] image2:dic[@"image_2"] image3:dic[@"image_3"] andDate:dic[@"Date"]];
    LzgLikesModel *likeCenter=[LzgLikesModel shareInstance];
    [likeCenter saveAlike:model];
}
-(void)p_setupUI
{
    
    
    
    [self.baseScroView sd_addSubviews:@[_topimg,_portrait,_fixedDataLabel_Personal,_userName,_idLabel,_likesContent,_likesLabel,_messageLabel,_messagetableView,_menu]];
    //
//    float accumulateHeight_var=self.tabBarController.tabBar.frame.size.height+44;
    static float accumulateHeight=0;
    _topimg.sd_layout
    .topEqualToView(self.baseScroView)
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .heightIs(300*LZGHEIGHT);
    accumulateHeight+=300;
    //
    _portrait.sd_layout
    .topSpaceToView(self.baseScroView,  50*LZGHEIGHT)
    .centerXEqualToView(self.baseScroView)
    .widthIs(70*LZGWIDTH)
    .heightEqualToWidth();
    //
    _fixedDataLabel_Personal.sd_layout
    .bottomSpaceToView(_portrait, 10*LZGHEIGHT)
    .centerXEqualToView(_portrait)
    .heightIs(20*LZGHEIGHT);
    [_fixedDataLabel_Personal setSingleLineAutoResizeWithMaxWidth:150*LZGWIDTH];
    //
    _userName.sd_layout.topSpaceToView(_portrait, 10*LZGHEIGHT)
    .centerXEqualToView(_portrait)
    .heightIs(25);
    [_userName setSingleLineAutoResizeWithMaxWidth:250];
    //
    _idLabel.sd_layout
    .topSpaceToView(_userName, 1*LZGHEIGHT)
    .heightIs(10*LZGHEIGHT)
    .centerXEqualToView(_userName);
    [_idLabel setSingleLineAutoResizeWithMaxWidth:200];
    //
#pragma mark likes 展示图的高度设置
    float heightOfTheLikesImageView=25;
    _likesLabel.sd_layout
    .topSpaceToView(self.baseScroView, 300*LZGHEIGHT-(heightOfTheLikesImageView/2*LZGHEIGHT))
    .leftSpaceToView(self.baseScroView, 20*LZGWIDTH)
    .widthIs(100*LZGWIDTH)
    .heightIs(heightOfTheLikesImageView*LZGHEIGHT);
    accumulateHeight+=heightOfTheLikesImageView*0.5;
    //
    _likesContent.sd_layout
    .leftEqualToView(self.baseScroView)
    .topSpaceToView(_likesLabel, 10*LZGHEIGHT)
    .rightEqualToView(self.baseScroView)
    .heightIs(90*LZGHEIGHT);
     accumulateHeight+=100;
    //
    //
    _messageLabel.sd_layout
    .leftEqualToView(_likesLabel)
    .widthRatioToView(_likesLabel, 1)
    .heightRatioToView(_likesLabel, 1)
    .topSpaceToView(_likesContent, 10*LZGHEIGHT);
    accumulateHeight+=heightOfTheLikesImageView+10;
    //
    
    CGFloat heightOfTheMessageTableView=150;
    _messagetableView.sd_layout
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .topSpaceToView(_messageLabel, 10*LZGHEIGHT)
    .heightIs(heightOfTheMessageTableView*LZGHEIGHT);
    accumulateHeight+=heightOfTheMessageTableView+10;
    //
    
    
    CGFloat heightOfTableViewCell=[self.menuDelegate cellHeightForIndexPath:0 cellContentViewWidth:SCREENWIDTH tableView:self.menu];
    CGFloat theGapBetweenCells=10;
    NSInteger countOfCells=2;
    accumulateHeight+=heightOfTableViewCell*countOfCells+theGapBetweenCells;
    CGFloat theHeigjtOfMenuTableView=(countOfCells+1)*theGapBetweenCells+countOfCells*heightOfTableViewCell;
    _menu.sd_layout.
    leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .topSpaceToView(_messagetableView, 10*LZGHEIGHT)
    .heightIs(theHeigjtOfMenuTableView*LZGHEIGHT);
    accumulateHeight+=theHeigjtOfMenuTableView;

#pragma mark 根据不同设备，滑动长度的调整
    
    LzgDevicePixlesHandle *pxHandle=[LzgDevicePixlesHandle shareInstance];
    NSString *deviceName=[pxHandle deviceName];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
       if ([deviceName isEqualToString:LzgDevicePixlesHandleIphone8])
         {
             accumulateHeight-=60;
         }
         else if ([deviceName isEqualToString:LzgDevicePixlesHandleIphone8plus])
         {
             
         }
         else if ([deviceName isEqualToString:LzgDevicePixlesHandleIphone11])
         {
             accumulateHeight+=170;
         }
         else if ([deviceName isEqualToString:LzgDevicePixlesHandleIphone11Pro])
         {
             accumulateHeight+=90;
         }
         else if ([deviceName isEqualToString:LzgDevicePixlesHandleIphone11ProMax])
         {
              accumulateHeight+=90;
         }
#pragma clang diagnostic pop
   
[self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, accumulateHeight)];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kBackGroundColor;
    self.userName.text=[[LzgLogStatus shareInstance] currentLogName];

     [self p_setupUI];
    [self p_initializeData];
    // Do any additional setup after loading the view.
}
-(void)p_initializeData
{
    self.messageArray=[[LzgMessageCenter shareInstance] messages] ;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark  UIcollectionView的代理和数据
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewsDetailViewController *vc=[[NewsDetailViewController alloc]init];
    vc.likesBtn.belongto=[_likesContent cellForItemAtIndexPath:indexPath];
    vc.blockingBtn.belongto=[_likesContent cellForItemAtIndexPath:indexPath];
    vc.likesBtn.selected=YES;
    vc.delegate=self;
    vc.handleUi = ^(UILabel * _Nonnull title, LzgLabel * _Nonnull content, UIImageView * _Nonnull img_1, UIImageView * _Nonnull img_2, UIImageView * _Nonnull img_3, UIView * _Nonnull basementView, UIButton * _Nonnull blocking) {
        LzgLikesModel *likeCenter=[LzgLikesModel shareInstance];
        LikesModel *mode=[[likeCenter likes] objectAtIndex:indexPath.row];
        title.text=mode.theLikes_title;
        content.text=mode.theLikes_content;
       [ img_1 yy_setImageWithURL:mode.urlToImage1 placeholder:[UIImage imageNamed:@"bitmap"]];
        [img_2 yy_setImageWithURL:mode.urlToImage2 placeholder:[UIImage imageNamed:@"bitmap"]];
        [img_3 yy_setImageWithURL:mode.urlToimage3 placeholder:[UIImage imageNamed:@"bitmap"]];
        UIScrollView *base=(UIScrollView *)basementView;
                            CGSize theScroViewContentSize=base.contentSize;
        NSString *theContent=mode.theLikes_content;
                            CGSize refenreceSize=CGSizeMake(SCREENWIDTH-40*LZGWIDTH, MAXFLOAT);
                            LzgLabel *templabel=[[LzgLabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH-40*LZGWIDTH,0)];
                            templabel.numberOfLines=0;
                            templabel.font=content.font;
                            templabel.textAlignment=NSTextAlignmentNatural;
                            templabel.text=theContent;
                            CGSize theStringSize=[templabel sizeThatFits:refenreceSize];
                    #pragma mark 由于使用了自定义的Label，故计算的高度需要调整
        
                            theScroViewContentSize.height+=theStringSize.height;
                            theScroViewContentSize.height+=200;
                            //
                            //
                             content.sd_resetLayout
                            .heightIs(theStringSize.height*LZGHEIGHT)
                            .leftEqualToView(title)
                            .rightSpaceToView(basementView, 20*LZGWIDTH)
                            .topSpaceToView(blocking, 5*LZGHEIGHT);
                             content.text=mode.theLikes_content;
                             //
                            base.contentSize=theScroViewContentSize;
        
    };
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    LzgLikeCollectionVIewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LzgLikeCollectionVIewCell class]) forIndexPath:indexPath];
    LzgLikesModel *likeCenter=[LzgLikesModel shareInstance];
    LikesModel *aLike=[[likeCenter likes] objectAtIndex:indexPath.row];
//    NSLog(@"%s:%@",sel_getName(_cmd),aLike.theLikes_title);
    cell.titile.text=aLike.theLikes_title;
    cell.briefContent.text=aLike.theLikes_content;
    UITapGestureRecognizer *cellTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(p_cellTap:)];
    [cell addGestureRecognizer:cellTap];
    
    return cell;
}
-(void)p_cellTap:(UITapGestureRecognizer *)cellTap
{
    UICollectionViewCell *cell=(UICollectionViewCell *)cellTap.view;
    NSIndexPath *cellPath=[_likesContent indexPathForCell:cell];
    [self collectionView:_likesContent didSelectItemAtIndexPath:cellPath];
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_likesCenter numOfLikes];
}
#pragma mark UITableView
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    LzgMessageCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LzgMessageCell class])];
    if (cell==nil)
    {
        cell=[[LzgMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([LzgMessageCell class])];
    }
    cell.delegate=self;
    LzgMessageModel *cellmodel=[[LzgMessageCenter shareInstance].messages objectAtIndex:indexPath.section];
    cell.deleteMesage.belongto=cell;
    cell.reply.belongto=cell;
    [cell.portrait yy_setImageWithURL:cellmodel.urlofPortraite placeholder:[UIImage imageNamed:@"bitmap"]];
    cell.userName.text=cellmodel.nameOfUser;
    cell.message.text=cellmodel.mesageBody;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [[LzgMessageCenter shareInstance].messages count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_messagetableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:_messagetableView];
}
- (void)LzgMessageCellDeletteAction:(nonnull UIButton *)sender
{
    UITableViewCell *cell=sender.belongto;
//    [_messagetableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:[_messagetableView indexPathForCell:cell].section]] withRowAnimation:UITableViewRowAnimationFade];
    NSIndexSet *setSections=[NSIndexSet indexSetWithIndex:[_messagetableView indexPathForCell:cell].section];
      
    
//    [_messagetableView beginUpdates];
   [[LzgMessageCenter shareInstance] deleteAMSAtIndex:[_messagetableView indexPathForCell:cell].section];
    [_messagetableView  deleteSections:setSections withRowAnimation:UITableViewRowAnimationFade];
//    [_messagetableView endUpdates];
    
}

- (void)LzgMessageCellReplyAction:(nonnull UIButton *)sender {
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
#pragma mark 收藏的代理方法
-(void)NewsDetailViewControllerDelegateLikeAction:(UIButton *)sender
{
    [self NewsDetailViewControllerDelegateBlockingAction:sender];
}
-(void)NewsDetailViewControllerDelegateBlockingAction:(UIButton *)sender
{
    
    LzgLikesModel *likeCenter=[LzgLikesModel shareInstance];
    UICollectionViewCell *theCell=sender.belongto;
    NSIndexPath *thePath=[_likesContent indexPathForCell:theCell];
    [likeCenter deleteAlikeAtIndex:thePath.row];
    [_likesContent reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
