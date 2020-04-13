//
//  LzgTableView.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/13.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgTableView.h"
@interface LzgTableView()<UIGestureRecognizerDelegate>

@end

@implementation LzgTableView
-(instancetype)init
{
    if (self=[super init])
    {
        self.showsVerticalScrollIndicator=NO;
    }
    return self;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
