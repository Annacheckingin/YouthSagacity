//
//  LzgBackBtnWithScroViewViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBackBtnWithScroViewViewController.h"
#import "UIViewController+LzgBackButtonImage.h"
static UIImage *backbtnimage;
@interface LzgBackBtnWithScroViewViewController ()
{
    @protected
    UIImage *_intanceBackBtnImage;
    UIButton *_backAction;
}
@property(nonatomic,strong)UIImage *intanceBackBtnImage;
@property(nonatomic,strong)UIButton *backAction;
@property(nonatomic,readwrite)UIButton *backButton;
@end

@implementation LzgBackBtnWithScroViewViewController
-(void)setInstanceImage:(UIImage *)image
{
    _intanceBackBtnImage=image;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:YES];
}
-(instancetype)init
{
    if (self=[super init])
    {
        _backAction=[[UIButton alloc]init];
        
        _backAction.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_backAction addTarget:self action:@selector(kbackAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    UIImage *aimg=[LzgBackBtnWithScroViewViewController theBackButtonImage];
    
#pragma mark 处理不使用统一的全局返回按钮图片，而进行自定义的情况
    if (aimg)
    {
        [_backAction setImage:aimg forState:UIControlStateNormal];
    }
    else
    {

        if (_intanceBackBtnImage)
        {
            [_backAction setImage:_intanceBackBtnImage forState:UIControlStateNormal];
        }
        
    }
    return self;
}
+(void)configureTheBackBtnImage:(UIImage *)image
{
   
    [self setTheBackButtonImage:image];
}
-(void)kbackAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTheViewInBottomView:_backAction andSDAutoLayoutModel:^(UIView * _Nonnull theview, UIView * _Nonnull theBaseView)
    {
        theview.sd_layout.leftSpaceToView(theBaseView, 10*LZGWIDTH)
        .topSpaceToView(theBaseView, 30*LZGHEIGHT)
        .widthIs(150*LZGWIDTH)
        .heightIs(50*LZGHEIGHT);
    }];
    [self addTheViewInBottomView:_backAction andSDAutoLayoutModel:^(UIView * _Nonnull theview, UIView * _Nonnull theBaseView)
    {
        theview.sd_layout.leftSpaceToView(theBaseView, 15*LZGWIDTH)
        .topSpaceToView(theBaseView, 40*LZGHEIGHT)
        .widthIs(25*LZGWIDTH)
        .heightIs(15*LZGHEIGHT);
        [theBaseView bringSubviewToFront:theview];
    }];
    // Do any additional setup after loading the view.
}
+(void)initialize
{
    [LzgBackBtnWithScroViewViewController configureTheBackBtnImage:[UIImage imageNamed:@"back"]];
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
