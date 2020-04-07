#import <UIKit/UIKit.h>
#if __has_include(<YYImage/YYImage.h>)
FOUNDATION_EXPORT double YYImageVersionNumber;
FOUNDATION_EXPORT const unsigned char YYImageVersionString[];
#import <YYImage/YYFrameImage.h>
#import <YYImage/YYSpriteSheetImage.h>
#import <YYImage/YYImageCoder.h>
#import <YYImage/YYAnimatedImageView.h>
#elif __has_include(<YYWebImage/YYImage.h>)
#import <YYWebImage/YYFrameImage.h>
#import <YYWebImage/YYSpriteSheetImage.h>
#import <YYWebImage/YYImageCoder.h>
#import <YYWebImage/YYAnimatedImageView.h>
#else
#import "YYFrameImage.h"
#import "YYSpriteSheetImage.h"
#import "YYImageCoder.h"
#import "YYAnimatedImageView.h"
#endif
NS_ASSUME_NONNULL_BEGIN
@interface YYImage : UIImage <YYAnimatedImage>
+ (nullable YYImage *)imageNamed:(NSString *)name; 
+ (nullable YYImage *)imageWithContentsOfFile:(NSString *)path;
+ (nullable YYImage *)imageWithData:(NSData *)data;
+ (nullable YYImage *)imageWithData:(NSData *)data scale:(CGFloat)scale;
@property (nonatomic, readonly) YYImageType animatedImageType;
@property (nullable, nonatomic, readonly) NSData *animatedImageData;
@property (nonatomic, readonly) NSUInteger animatedImageMemorySize;
@property (nonatomic) BOOL preloadAllAnimatedImageFrames;
@end
NS_ASSUME_NONNULL_END
