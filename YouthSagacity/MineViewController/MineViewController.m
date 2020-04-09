//
//  MineViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "MineViewController.h"
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
-(void)p_setupUI;
@end

@implementation MineViewController
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
        _likesLabel.backgroundColor=UIColor.redColor;
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        
        _likesContent=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _messageLabel=[[UIImageView alloc]init];
        _messageLabel.contentMode=_likesLabel.contentMode;
        _messageLabel.image=[UIImage imageNamed:@"5_29"];
        _messagetableView=[[UITableView alloc]init];
        _menu=[[UITableView alloc]init];
        
        [self p_setupUI];
        
    }
 
    return self;
}
-(void)p_setupUI
{
    [self.baseScroView sd_addSubviews:@[_topimg,_portrait,_fixedDataLabel_Personal,_userName,_idLabel,_likesContent,_likesLabel,_messageLabel,_messagetableView,_menu]];
    //
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
    accumulateHeight+=75;
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
    accumulateHeight+=35;
    //
    _idLabel.sd_layout
    .topSpaceToView(_userName, 1*LZGHEIGHT)
    .heightIs(10*LZGHEIGHT)
    .centerXEqualToView(_userName);
    accumulateHeight+=11;
    [_idLabel setSingleLineAutoResizeWithMaxWidth:200];
    //
#pragma mark likes 展示图的高度设置
    float heightOfTheLikesImageView=25;
    _likesLabel.sd_layout
    .topSpaceToView(self.baseScroView, 300*LZGHEIGHT-(heightOfTheLikesImageView/2*LZGHEIGHT))
    .leftSpaceToView(self.baseScroView, 20*LZGWIDTH)
    .widthIs(100*LZGWIDTH)
    .heightIs(heightOfTheLikesImageView*LZGHEIGHT);
    
    
    
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kBackGroundColor;
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
