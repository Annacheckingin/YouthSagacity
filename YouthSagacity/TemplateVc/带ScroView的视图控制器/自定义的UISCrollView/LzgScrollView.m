//
//  LzgScrollView.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/13.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgScrollView.h"
@interface LzgScrollView ()
@property(nonatomic,assign)BOOL kAllowDifferentGR;

@end
@implementation LzgScrollView
-(void)setThekAllowDifferentGR:(BOOL)para
{
    _kAllowDifferentGR=para;
}
-(instancetype)init
{
    if (self=[super  init])
    {
        _kAllowDifferentGR=YES;
    }
    return self;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return _kAllowDifferentGR;
}


@end
