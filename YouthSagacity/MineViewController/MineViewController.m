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
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
@interface MineViewController ()
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
        _likesContent.backgroundColor=UIColor.clearColor;
        _messageLabel=[[UIImageView alloc]init];
        _messageLabel.contentMode=_likesLabel.contentMode;
        _messageLabel.image=[UIImage imageNamed:@"5_29"];
        _messagetableView=[[UITableView alloc]init];
        _messagetableView.backgroundColor=UIColor.clearColor;
        _menu=[[UITableView alloc]init];
        _menu.delegate=self.menuDelegate;
        self.menuDelegate.belongto=self.menu;
        _menu.dataSource=self.menuDataSource;
        self.menuDataSource.belongto=self.menu;
        _menu.scrollEnabled=NO;
        _menu.separatorStyle=UITableViewCellSelectionStyleNone;
        _menu.backgroundColor=UIColor.clearColor;
        
        
    }
 
    return self;
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
    NSLog(@"%lf",SCREENHEIGHT);
    NSLog(@"%lf",SCREENWIDTH);
    accumulateHeight+=theHeigjtOfMenuTableView;
    
    
#pragma mark 考虑到TabBar的高度
    accumulateHeight+=44;
#pragma mark 异形屏还需要34px
    if (LZGHEIGHT!=1)
    {
          accumulateHeight+=34;
    }
  
    //
#pragma mark 做滑动界面的长度调整
    //
if (accumulateHeight<SCREENHEIGHT)
    {
        NSLog(@"小于");
        accumulateHeight=SCREENHEIGHT;
    }
#pragma mark 作为屏幕的调试
    //
    accumulateHeight+=100;
[self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, accumulateHeight)];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kBackGroundColor;
    
     [self p_setupUI];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
