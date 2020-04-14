//
//  UIButton+LzgButtonBelongToVc.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/14.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "UIButton+LzgButtonBelongToVc.h"
#import <objc/runtime.h>

static const char *LzgButtonBelongToVcKey="LzgButtonBelongToVc";
@implementation UIButton (LzgButtonBelongToVc)
-(void)setBelongToVc:(id)belongToVc
{
    objc_setAssociatedObject(self, LzgButtonBelongToVcKey, belongToVc, OBJC_ASSOCIATION_ASSIGN);
}
-(id)belongToVc
{
    return objc_getAssociatedObject(self, LzgButtonBelongToVcKey);
}
@end
