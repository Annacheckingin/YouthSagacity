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
@property(nonatomic,strong)UIButton *thumb;
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
    


    if (self=[super init])
    {
        self.hidesBottomBarWhenPushed=YES;
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
        _authorName.font=[UIFont fontWithName:@"AmericanTypewriter-Bold" size:11];
        _dateLabel=[[UILabel alloc]init];
        _dateLabel.textColor=UIColor.lightGrayColor;
        _dateLabel.font=[UIFont systemFontOfSize:9];
        _forbidBtn=[[UIButton alloc]init];
        _forbidBtn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_forbidBtn setImage:[UIImage imageNamed:@"5_37"] forState:UIControlStateNormal];
        _reportBtn=[[UIButton alloc]init];
        _reportBtn.imageView.contentMode=_forbidBtn.imageView.contentMode;
        [_reportBtn setImage:[UIImage imageNamed:@"5_40"] forState:UIControlStateNormal];
        _articleTitle=[[UILabel alloc]init];
        _articleTitle.numberOfLines=0;
        
        _articleTitle.font=[UIFont fontWithName:@"AmericanTypewriter" size:15];
        _content=[[LzgLabel alloc]init];
        _content.textColor=UIColor.lightGrayColor;
        _content.numberOfLines=0;
//        _content.lineBreakMode=NSLineBreakByTruncatingTail;
        _contentImage=[[UIImageView alloc]init];
        _contentImage.contentMode=UIViewContentModeScaleAspectFit;
        _thumbNums=[[UILabel alloc]init];
        _thumbNums.font=[UIFont systemFontOfSize:10];
        _thumb=[[UIButton alloc]init];
        [_thumb setImage:[UIImage imageNamed:@"5_135"] forState:UIControlStateNormal];
        [_thumb setImage:[UIImage imageNamed:@"5_132"] forState:UIControlStateSelected];
        [_thumb addTarget:self action:@selector(p_thumChangePic:) forControlEvents:UIControlEventTouchUpInside];
        
        //
#pragma  mark 测试数据
    }
    return self;
}
-(void)p_thumChangePic:(UIButton *)sender
{
    sender.selected=!sender.selected;
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
    
    __weak UIView *portraite,*authorName,*dateLabel,*articleTitle,*content,*contentImage,*thumbNums,*baseView;
    portraite=_portraite;
    authorName=_authorName;
    dateLabel=_dateLabel;
    articleTitle=_articleTitle;
    content=_content;
    contentImage=_contentImage;
    thumbNums=_thumbNums;
    baseView=self.baseScroView;
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    if (self.hanleUI!=nil)
    {
         self.hanleUI(portraite, authorName, dateLabel,articleTitle, content, contentImage, thumbNums,baseView);
        [self p_loadTheComment];
    }
   
#pragma diagnostic pop
    
}
-(void)p_loadTheComment
{
    
}
-(void)p_setUpUi
{
    [self.baseScroView sd_addSubviews:@[_portraite,_authorName,_dateLabel,_forbidBtn,_reportBtn,_articleTitle,_content,_contentImage,_thumb,_thumbNums]];
    static float accumulateHeight=0;
    _portraite.sd_layout
    .leftSpaceToView(self.baseScroView, 20*LZGHEIGHT)
    .topSpaceToView(self.baseScroView, 40*LZGHEIGHT)
    .widthIs(50*LZGWIDTH)
    .heightEqualToWidth();
    accumulateHeight+=90;
    //
    _authorName.sd_layout
    .leftSpaceToView(_portraite, 10*LZGWIDTH)
    .centerYEqualToView(_portraite)
    .heightIs(15*LZGHEIGHT)
    ;
    [_authorName setSingleLineAutoResizeWithMaxWidth:200];
    //
    _dateLabel.sd_layout.leftEqualToView(_authorName)
    .topSpaceToView(_authorName, 2)
    .heightIs(10);
    [_dateLabel setSingleLineAutoResizeWithMaxWidth:150];
    //
    _forbidBtn.sd_layout.rightSpaceToView(self.baseScroView, 20*LZGWIDTH)
    .centerYEqualToView(_portraite)
    .widthIs(30*LZGWIDTH)
    .heightEqualToWidth();
    //
    _reportBtn.sd_layout.rightSpaceToView(_forbidBtn, 5*LZGWIDTH)
    .centerYEqualToView(_forbidBtn)
    .heightRatioToView(_forbidBtn, 1)
    .widthEqualToHeight();
    
    //
    //
     _articleTitle.sd_layout
     .leftEqualToView(_portraite)
     .topSpaceToView(_portraite, 10*LZGHEIGHT)
     .heightIs(13);
     [_articleTitle setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH-40*LZGWIDTH];
     //
     //
    _content.sd_layout.topSpaceToView(_articleTitle, 10*LZGHEIGHT)
    .leftEqualToView(_portraite)
    .rightSpaceToView(self.baseScroView, 20*LZGWIDTH);
    //
    _contentImage.sd_layout
    .topSpaceToView(_content, 10*LZGHEIGHT)
    .leftEqualToView(_content)
    .rightEqualToView(_content)
    .heightIs(200*LZGHEIGHT);
    //
    
    
}
-(void)setDelegate:(id<LzgDetailsViewControllerDelegate>)delegate
{
    
    _delegate=delegate;
    if ([_delegate conformsToProtocol:@protocol(LzgDetailsViewControllerDelegate) ])
    {
     
        if ([_delegate respondsToSelector:@selector(LzgDetailsViewControllerForBideAction:)])
        {
      
            [_forbidBtn addTarget:_delegate action:@selector(LzgDetailsViewControllerForBideAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        if ([_delegate respondsToSelector:@selector(LzgDetailsViewControllerReportAtion:)])
        {
            [_reportBtn addTarget:_delegate action:@selector(LzgDetailsViewControllerReportAtion:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
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
