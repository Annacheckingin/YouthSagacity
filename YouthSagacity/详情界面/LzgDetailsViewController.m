//
//  LzgDetailsViewController.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgDetailsViewController.h"
#import "LzgLabel.h"
@interface LzgDetailsViewController ()
@property(nonatomic,strong)UIImageView *portraite;
@property(nonatomic,strong) UILabel *authorName;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UIButton *forbidBtn;
@property(nonatomic,strong)UIButton *reportBtn;
@property(nonatomic,strong)UILabel *articleTitle;
@property(nonatomic,strong)LzgLabel *content;
@property(nonatomic,strong)UIImageView *contentImage;
@property(nonatomic,strong)UILabel *thumbNums;
//
@property(nonatomic,strong)UIImageView *thumb;
@property(nonatomic,strong)UIImageView *commentsPicture;
@property(nonatomic,strong)UITableView *commentsTableView;
@property(nonatomic,strong)NSMutableDictionary *p_pageinfor;
@end

@implementation LzgDetailsViewController
-(UITableView *)commentsTableView
{
    if (_commentsTableView==nil)
    {
        _commentsTableView=[[UITableView alloc]init];
    }
    return _commentsTableView;
}
-(instancetype)init
{
    
#pragma mark 必须在调用超类的方法前设置好一些图片资料
    [LzgBackBtnWithScroViewViewController configureTheBackBtnImage:[UIImage imageNamed:@"back"]];
    if (self=[super init])
    {
        /*
         @property(nonatomic,strong)UIImageView *portraite;
         @property(nonatomic,strong) UILabel *authorName;
         @property(nonatomic,strong)UILabel *dateLabel;
         @property(nonatomic,strong)UIButton *forbidBtn;
         @property(nonatomic,strong)UIButton *reportBtn;
         @property(nonatomic,strong)UILabel *articleTitle;
         @property(nonatomic,strong)LzgLabel *content;
         @property(nonatomic,strong)UIImageView *contentImage;
         @property(nonatomic,strong)UILabel *thumbNums;
         **/
    
        _portraite=[[UIImageView alloc]init];
        _authorName=[[UILabel alloc]init];
        _dateLabel=[[UILabel alloc]init];
        _forbidBtn=[[UIButton alloc]init];
        _reportBtn=[[UIButton alloc]init];
        _articleTitle=[[UILabel alloc]init];
        _content=[[LzgLabel alloc]init];
        _contentImage=[[UIImageView alloc]init];
        _thumbNums=[[UILabel alloc]init];
        _thumb=[[UIImageView alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self p_setUpUi];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self p_refreshData];
}
-(void)p_refreshData
{
    if (_datasource==nil)
    {
        return;
    }
    self.hanleUI(_portraite, _authorName, _dateLabel, _content, _contentImage, _thumbNums);
    [self p_loadTheComment];
}
-(void)p_loadTheComment
{
    
}
-(void)p_setUpUi
{
    [self.baseScroView sd_addSubviews:@[_portraite,_authorName,_dateLabel,_forbidBtn,_reportBtn,_articleTitle,_content,_contentImage,_thumb,_thumbNums]];
    
    
    
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
