//
//  LzgTextField.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/3.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgTextField : UITextField
+(void)setTheIndentation:(CGFloat)indentation;
@property(nonatomic,readonly)CGFloat indentation;
@end

NS_ASSUME_NONNULL_END
