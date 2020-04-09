//
//  LzgScroBaseViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgScroBaseViewController.h"

@interface LzgScroBaseViewController ()
{
    @protected
    UIScrollView *_baseScroView;
}
@property(nonatomic,strong)UIScrollView *baseScroView;

@end

@implementation LzgScroBaseViewController
-(void)addTheViewInBottomView:(UIView *)aview andSDAutoLayoutModel:(SDAutoLayoutModelBlock) block
{
    [self.view addSubview:aview];
    __weak typeof(self) weakself=self;
    __weak typeof(aview) weakView=aview;
    block(weakView,weakself.view);
}
-(CGPoint)currentOffSet
{
    if (_baseScroView)
    {
        return _baseScroView.contentOffset;
    }
    return CGPointZero;
}
-(void)setTheCurrentOffSet:(CGPoint)offset
{
    if (_baseScroView)
    {
        _baseScroView.contentOffset=offset;
    }
}
-(CGSize)currentScroViewContent
{
    if (_baseScroView)
    {
        return _baseScroView.contentSize;
    }
    return CGSizeZero;
}
-(void)setTheScroViewContentSize:(CGSize)size
{
    if (_baseScroView)
    {
        _baseScroView.contentSize=size;
        [_baseScroView layoutIfNeeded];
    }
}
-(instancetype)init
{
    if (self=[super init])
    {
        _baseScroView=[[UIScrollView alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view addSubview:_baseScroView];
    _baseScroView.backgroundColor=UIColor.clearColor;
    //
    _baseScroView.sd_layout
    .leftEqualToView(self.view)
    .topEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    _baseScroView.contentSize=[UIScreen mainScreen].bounds.size;
    //
    
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
