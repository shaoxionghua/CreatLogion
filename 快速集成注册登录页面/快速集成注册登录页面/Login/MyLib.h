//
//  MyLib.h
//  MyLib
//
//  Created by danggui on 16/3/28.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyLib : NSObject

- (NSInteger) add:(NSInteger)a and:(NSInteger)b;
+ (NSString*) connect:(NSString*)str1 and:(NSString*)str2;

/**
 * 自定义uiview
 *
 */
+ (UIView*) CreatMyView:(CGRect)frame;

/**
 *  0:普通带边框UILabel
 *  1:带虚线边框UILabel
 */
+ (UILabel*) CreatMyLab:(CGRect)frame :(NSString *)str :(UIColor *)bgcolor :(UIColor *)linecolor :(int)Type;

/**
 *  0:普通带边框UIButton
 *  1:带虚线边框UIButton
 */
+ (UIButton*) CreatMyBtn:(CGRect)frame :(NSString *)str :(UIColor *)bgcolor :(UIColor *)linecolor :(int)Type;


/**
 *  0:fontello_UILabel
 */
+ (UILabel*) CreatFontelloLab:(CGRect)frame :(NSString *)str :(UIFont *)font :(UIColor *)fontColor :(int)Type;

/**
 *  fontello_UIButton
 */
+ (UIButton*) CreatFontelloBtn:(CGRect)frame :(NSString *)str :(UIFont *)font :(UIColor *)fontColor :(int)Type;



/**
 *  带小红点的UIButton
 */

+ (void)UIButtonShowBadgeOnItemIndex:(id)sender; //显示小红点
+ (void)UIButtonHideBadgeOnItemIndex:(id)sender; //隐藏小红点

/**
 *  带小红点的UITabBar
 */

+ (void)UITabBarShowBadgeOnItemIndex:(id)sender :(int)index :(int)Num;   //UITabBar显示小红点
+ (void)UITabBarHideBadgeOnItemIndex:(id)sender :(int)index :(int)Num;  //UITabBar隐藏小红点

/**
 * 颜色转换 IOS中十六进制的颜色转换为UIColor
 */

+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  判断数据类型(多用于json解析的数据，先全部格式化成字符串再进行判断)
 */

+ (BOOL)isPureInt:(NSString*)string;
+ (BOOL)isPureFloat:(NSString*)string;

/**
 * 数据转换把单位为分的价格转成价格为元的价格，保留两位小数
 */
+ (NSString *)changePrice:(NSString *)price;
+ (NSString *)changePriceWithYang:(NSString *)price;

+ (BOOL)isNetworkEnabled;


+ (NSString *)GetDeviceToken;


+ (NSString *)string:(id)sender;

+ (CGFloat)MyW;
+ (CGFloat)MyH;
+ (CGFloat)MyX;
+ (CGFloat)MyY;
+ (CGRect)MyFrame;


//返回字符串所占用的尺寸.
//+ (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
+ (CGSize)sizeWithString:(NSString *)str :(UIFont *)font maxSize:(CGSize)maxSize;


+ (NSMutableAttributedString *)changeText:(NSString *)sender :(UIFont *)font :(UIColor *)color;
+ (NSMutableAttributedString *)changeTextWithYang:(NSString *)sender :(UIFont *)font :(UIColor *)color;

+ (NSMutableArray *)idleImages;

+ (NSMutableArray *)refreshingImages;

+ (NSMutableArray *)pullingImages;


+ (NSString *)PhoneNumFormat:(NSString *)phone;

+ (UIViewController *)appRootViewController;


+ (UIView *)isNetWork;
//        UIView *im = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        im.isNetWork = YES;
//        [WS addSubview:im];

+ (UIImageView *)circleImageView: (CGRect)frame : (UIColor *)circleColor :(UIImage *)image;


+ (BOOL)Compare:(NSDate *)date1 with:(NSDate *)date2;

+ (BOOL)isNull:(id)data;

@end
