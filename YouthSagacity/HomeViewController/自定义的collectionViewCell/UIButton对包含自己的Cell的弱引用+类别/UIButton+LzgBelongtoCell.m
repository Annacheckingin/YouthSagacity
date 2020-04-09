//
//  UIButton+LzgBelongtoCell.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "UIButton+LzgBelongtoCell.h"
#import <objc/runtime.h>


static const char *LzgBelongtoCellKey="LzgBelongtoCellKey";
@implementation UIButton (LzgBelongtoCell)
-(id)belongto
{
    return objc_getAssociatedObject(self, LzgBelongtoCellKey);
}
-(void)setBelongto:(id)belongto
{
    objc_setAssociatedObject(self, LzgBelongtoCellKey, belongto, OBJC_ASSOCIATION_ASSIGN);
}
@end
