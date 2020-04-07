//
//  LzgTextField.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/3.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgTextField.h"
#import <objc/runtime.h>
@interface LzgTextField ()

@property(nonatomic,assign)CGFloat indentation;
@end
@implementation LzgTextField
static const char *LzgTextFieldPropertyIndentationKey="LzgTextFieldPropertyIndentationKey";
+(void)setTheIndentation:(CGFloat)indentation
{
    NSNumber *floatnumer=[NSNumber numberWithFloat:indentation];
    objc_setAssociatedObject(self, LzgTextFieldPropertyIndentationKey,floatnumer, OBJC_ASSOCIATION_ASSIGN);
}
+(CGFloat)theIndentation
{
 NSNumber *thevalue=objc_getAssociatedObject(self, LzgTextFieldPropertyIndentationKey);
    return thevalue.floatValue;
}
-(CGFloat)indentation
{
    if ([LzgTextField theIndentation]==0)
    {
        return 20.0;
    }
    return [LzgTextField theIndentation];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
    UIView *lefttextfieldView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.indentation*LZGWIDTH, frame.size.height*LZGHEIGHT)];
        //        _userAcount.leftViewMode=UITextFieldViewModeAlways;
    UIView *righttextfieldView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.indentation*LZGWIDTH, frame.size.height*LZGHEIGHT)];
    self.leftView=lefttextfieldView;
    self.rightView=righttextfieldView;
    lefttextfieldView.userInteractionEnabled=NO;
    righttextfieldView.userInteractionEnabled=NO;
    self.leftViewMode=UITextFieldViewModeAlways;
    self.rightViewMode=UITextFieldViewModeAlways;
    }
    return self;
}
//
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
