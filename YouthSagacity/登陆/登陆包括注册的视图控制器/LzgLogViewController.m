//
//  LzgLogViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLogViewController.h"
#import "LzgLogModel.h"
#import "LzgRegistModel.h"
#import "LzgBundleInforPath.h"
#import "LzgTextField.h"
#import "LzgLogStatus.h"
#import "LzgLogModel+hard.h"
#import "LzgRegistModel+hard.h"
static LzgLogViewController *me;
@interface LzgLogViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *userAcount;
@property(nonatomic,strong)UITextField *userPassword;
@property(nonatomic,strong)UIButton *log;
@property(nonatomic,strong)UIButton *registerAcount;
@property(nonatomic,strong)UIButton *agreeTheRules;
@property(nonatomic,strong)UIButton *obeyTheRules;
@property(nonatomic,strong)UIImageView *brandPic;
@end
@implementation LzgLogViewController
-(instancetype)init
{
    if (self=[super init])
    {
        _brandPic=[[UIImageView alloc]init];
        _userAcount=[[LzgTextField alloc]init];
        _userAcount.font=[UIFont fontWithName:@"Courier-Bold" size:12];
        NSAttributedString *attributedStringForAcount=[[NSAttributedString alloc]initWithString:@"Acount" attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor,NSFontAttributeName:[UIFont fontWithName:@"Courier-Bold" size:11]}];
        NSAttributedString *attributedStringForPassWord=[[NSAttributedString alloc]initWithString:@"password" attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor,NSFontAttributeName:[UIFont fontWithName:@"Courier-Bold" size:11]}];
        _userAcount.attributedPlaceholder=attributedStringForAcount;
      
        _userPassword=[[LzgTextField alloc]init];
        _userPassword.font=_userAcount.font;
        _userPassword.attributedPlaceholder=attributedStringForPassWord;
        //
       /* UIView *lefttextfieldView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10*LZGWIDTH, 50*LZGHEIGHT)];
       //        _userAcount.leftViewMode=UITextFieldViewModeAlways;
               UIView *righttextfieldView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10*LZGWIDTH, 50*LZGHEIGHT)];*/
        _userPassword.layer.borderColor=[UIColor colorWithRed:78/255.0 green:87/255.0 blue:255/255.0 alpha:1].CGColor;
        _userAcount.layer.borderWidth=0.8;
        
        
        _userAcount.layer.cornerRadius=25;
        _userAcount.layer.masksToBounds=YES;
        //
        
        _userPassword.layer.borderColor=[UIColor colorWithRed:78/255.0 green:87/255.0 blue:255/255.0 alpha:1].CGColor;
        _userPassword.layer.borderWidth=0.8;
        _userPassword.layer.cornerRadius=25;
        _userPassword.layer.masksToBounds=YES;
        
//        _userPassword.leftViewMode=UITextFieldViewModeAlways;
        //
        
        _log=[[UIButton alloc]init];
        _registerAcount=[[UIButton alloc]init];
        _agreeTheRules=[[UIButton alloc]init];
        [_agreeTheRules addTarget:self action:@selector(kbtnSelfStatusChange:) forControlEvents:UIControlEventTouchUpInside];
        _obeyTheRules=[[UIButton alloc]init];
        [_log addTarget:self action:@selector(klogAction:) forControlEvents:UIControlEventTouchUpInside];
        [_registerAcount addTarget:self action:@selector(kregisterAction:) forControlEvents:UIControlEventTouchUpInside];
        [_obeyTheRules addTarget:self action:@selector(kRulesAction:) forControlEvents:UIControlEventTouchUpInside];
        for (UITextField *obj in @[_userPassword,_userAcount])
        {
            obj.delegate=self;
        }
    }
    return self;
}
-(void)kbtnSelfStatusChange:(UIButton *)sender
{
    sender.selected=!sender.selected;
}
-(void)kRulesAction:(UIButton *)sender
{
    
}
-(void)klogAction:(UIButton *)sender
{
    BOOL isobey=[self isObeyTheRules];
    if (!isobey)
    {
        UIAlertController *alertVc=[UIAlertController alertControllerWithTitle:@"Attention" message:@"you may have to wathch and choose obey the principles or not" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action_cancle=[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
        {
            [alertVc dismissViewControllerAnimated:YES completion:nil];
        }];
        UIAlertAction *action_ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            __weak typeof (self) weakself=self;
            [alertVc dismissViewControllerAnimated:YES completion:^
            {
                weakself.agreeTheRules.selected=YES;
            }];
            
            [alertVc dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertVc addAction:action_cancle];
        [alertVc addAction:action_ok];
        [self presentViewController:alertVc animated:YES completion:^
        {
            
        }];
        //
        
    }
    else
    {
        UIActivityIndicatorView *indicateView;
        indicateView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicateView.color=UIColor.blackColor;
        indicateView.hidesWhenStopped=YES;
        indicateView.frame=CGRectMake((SCREENWIDTH-50*LZGWIDTH)/2, (SCREENHEIGHT-50*LZGHEIGHT)/2, 50*LZGWIDTH, 50*LZGHEIGHT);
        [self.view addSubview:indicateView];
        [indicateView startAnimating];
        LzgLogModel *logModel=[LzgLogModel shareInstance];
//       BOOL  isvalidateLogging =[logModel loggingWithAcount:_userAcount.text andPassWord:_userPassword.text];
//       __block  BOOL  isvalidateLogging ;
        [logModel loggingWithAcount:_userAcount.text andPassWord:_userPassword.text handler:^(BOOL isucced, NSString *userid,NSString *username)
        {
            
            [self kAlertViewMangement:isucced andUserid:userid  andUserName:username indicateView:indicateView anctionString:@"log"];
        }];
    }
}
-(void)kAlertViewMangement:(BOOL)para andUserid:(NSString *)userid andUserName:(NSString *)username indicateView:(UIView *)view anctionString:(NSString *)logOrRegister;
{
    
    
    UIActivityIndicatorView *indicateView=(UIActivityIndicatorView *)view;
    
    switch (para)
     {
            case YES:
             [self kSuccesswithIdentifer:logOrRegister andUserId:userid anduserName:username];
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            default:
             [self kdoAttentionWithIdentifier:logOrRegister];
            break;
    }
    [indicateView stopAnimating];
    [indicateView removeFromSuperview];
}
-(void)kSuccesswithIdentifer:(NSString *)identifer andUserId:(NSString *)userid anduserName:(NSString *)usrName
{
    if ([identifer isEqualToString:@"register"])
    {
        UIAlertController *alertView=[UIAlertController alertControllerWithTitle:@"Register information" message:@"Register Done!" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertView animated:YES completion:^{
            sleep(1);
            [alertView dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        [[LzgLogStatus shareInstance] setLoggingStatus:YES WithId:userid anduserName:usrName];
    }
    
}
-(void)kdoAttentionWithIdentifier:(NSString *)identifier
{
    if ([identifier isEqualToString:@"log"])
    {
        UIAlertController *allerVc=[UIAlertController alertControllerWithTitle:@"Attention" message:@"wrong password" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:allerVc animated:YES completion:^
        {
            sleep(0.8);
            [allerVc dismissViewControllerAnimated:YES completion:^
            {
            }];
        }];
    }
    else if ([identifier isEqualToString:@"register"])
    {
        UIAlertController *allerVc=[UIAlertController alertControllerWithTitle:@"Attention" message:@"register failed" preferredStyle:UIAlertControllerStyleAlert];
               [self presentViewController:allerVc animated:YES completion:^
               {
                   sleep(0.8);
                   [allerVc dismissViewControllerAnimated:YES completion:nil];
               }];
    }
    
}
-(void)kregisterAction:(UIButton *)sender
{
    
    UIActivityIndicatorView *indicateView;
    indicateView.frame=CGRectMake((SCREENWIDTH-50*LZGWIDTH)/2, (SCREENHEIGHT-50*LZGHEIGHT)/2, 50*LZGWIDTH, 50*LZGHEIGHT);
    [self.view addSubview:indicateView];
    indicateView.color=UIColor.blackColor;
    [indicateView startAnimating];
    LzgRegistModel *registerModel=[LzgRegistModel shareInstance];
    [registerModel hardregistWithAcount:_userAcount.text andPassword:_userPassword.text handler:^(BOOL issucced)
    {
        [self kAlertViewMangement:issucced andUserid:nil  andUserName:nil indicateView:indicateView anctionString:@"register"];
    }];
}
+(instancetype)shareInstance
{
    if (!me)
    {
        me=[[LzgLogViewController alloc]init];
    }
    return me;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view sd_addSubviews:@[_brandPic,_userAcount,_userPassword,_log,_registerAcount,_agreeTheRules,_obeyTheRules]];
    _brandPic.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 50*LZGHEIGHT)
    .widthIs(100*LZGWIDTH)
    .heightEqualToWidth();
    //
    [_brandPic setImage:[UIImage imageWithContentsOfFile:[[LzgBundleInforPath shareInstance] pathOfImage:@"Youth Sagacity"]]];
    //
    _userAcount.sd_layout
    .topSpaceToView(_brandPic, 60*LZGHEIGHT)
    .leftSpaceToView(self.view, 20*LZGWIDTH)
    .rightSpaceToView(self.view, 20*LZGWIDTH)
    .heightIs(50*LZGHEIGHT);
    //
   
    //
    _userPassword.sd_layout
    .topSpaceToView(_userAcount, 10*LZGHEIGHT)
    .leftEqualToView(_userAcount)
    .rightEqualToView(_userAcount)
    .heightRatioToView(_userAcount, 1);
    //[UIColor colorWithRed:78/255.0 green:87/255.0 blue:255/255.0 alpha:1].CGColor;
    //
    
    //
    
    //
    //

    //
    _agreeTheRules.sd_layout
    .topSpaceToView(_userPassword, 10*LZGHEIGHT)
    .leftEqualToView(_userPassword).offset(5*LZGWIDTH)
    .heightIs(10*LZGHEIGHT)
    .widthEqualToHeight();
    NSString *imgUnselected=[[LzgBundleInforPath shareInstance] pathOfImage:@"weixuanzhong"];
    NSString *imgSelected=[[LzgBundleInforPath shareInstance] pathOfImage:@"xuanzhong"];
    [_agreeTheRules setImage:[UIImage imageWithContentsOfFile:imgUnselected] forState:UIControlStateNormal];
    [_agreeTheRules setImage:[UIImage imageWithContentsOfFile:imgSelected] forState:UIControlStateSelected];
    //
    _obeyTheRules.sd_layout
    .topSpaceToView(_userPassword, 10*LZGHEIGHT)
    .leftSpaceToView(_agreeTheRules, 10*LZGWIDTH)
    .heightRatioToView(_agreeTheRules, 1)
    .widthIs(150*LZGWIDTH);
    
    [_obeyTheRules setTitle:@"You need to read this before" forState:UIControlStateNormal];
    [_obeyTheRules setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    _obeyTheRules.font=[UIFont fontWithName:@"ArialRoundedMTBold" size:11];
    //
    _log.sd_layout
    .leftEqualToView(_userAcount)
    .widthRatioToView(_userAcount, 1)
    .topSpaceToView(_obeyTheRules, 20*LZGHEIGHT)
    .heightIs(50*LZGHEIGHT);
    _log.imageView.contentMode=UIViewContentModeScaleAspectFill;
    [_log setImage:[UIImage imageNamed:@"5_151"] forState:UIControlStateNormal];
    //
       _log.layer.cornerRadius=25;
       _log.layer.masksToBounds=YES;
    //
    //
    _registerAcount.sd_layout
    .topSpaceToView(_log, 10*LZGHEIGHT)
    .leftEqualToView(_log)
    .widthRatioToView(_userAcount, 1)
    .heightRatioToView(_userAcount, 1);
    [_registerAcount setTitle:@"Register" forState:UIControlStateNormal];
    //
    [_registerAcount setBackgroundColor:[UIColor colorWithRed:61/255.0 green:71/255.0 blue:255/255.0 alpha:1]];
    _registerAcount.layer.cornerRadius=25*LZGWIDTH;
    _registerAcount.clipsToBounds=YES;
    
    
    
}
-(BOOL)isObeyTheRules
{
    BOOL isobey=_agreeTheRules.selected;
    return isobey;
}
@end
