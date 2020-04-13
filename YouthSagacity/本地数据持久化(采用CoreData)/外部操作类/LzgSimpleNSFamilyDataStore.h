//
//  LzgSimpleNSFamilyDataStore.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/3.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UserInfor;
@class Pictures;
NS_ASSUME_NONNULL_BEGIN

@interface LzgSimpleNSFamilyDataStore : NSObject
+(instancetype)shareInstance;
-(BOOL)saveTheDataOfImageWithUrlString:(NSString *)urlString andImage:(UIImage *)img;
-(BOOL)saveTheDataOfUser:(NSString *)userid andTheName:(NSString *)name andPassword:(NSString *)password andTheQuitTime:(NSDate *)dateOfQuitTime logStatus:(BOOL) islog;
-(BOOL)hasLogUser:(void(^)(NSString  *userName))UserNameInfor;
-(BOOL)hasPics;
-(UserInfor *)userWithName:(NSString *)name;
-(UserInfor *)userWithId:(NSString *)idString;
-(Pictures *)picWithUrlString:(NSString *)urlString;
-(NSManagedObjectContext *)contextWithIdentifier:(NSString *)identifer;
@end

NS_ASSUME_NONNULL_END
