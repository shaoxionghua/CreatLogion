//
//  Toast.h
//  快速集成注册登录页面
//
//  Created by danggui on 2016/10/31.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>  
#import <UIKit/UIKit.h>

#define DEFAULT_DISPLAY_DURATION 3.0f

@interface Toast : NSObject {
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
    UIActivityIndicatorView *activityIndicatorView;
    
}

@property (nonatomic, assign) CFTimeInterval animationDuration;

+ (void)showWithText:(NSString *) text_;
+ (void)showWithText:(NSString *) text_
            duration:(CGFloat)duration_;

+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset_;
+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset
            duration:(CGFloat) duration_;

+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_;
+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_
            duration:(CGFloat) duration_;

+ (void)showActivity:(NSString *)text_;
+ (void)hiddenActivity;
@end
