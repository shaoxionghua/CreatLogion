//
//  MyLib.m
//  MyLib
//
//  Created by danggui on 16/3/28.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import "MyLib.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#include <netinet/in.h>

@implementation MyLib

- (NSInteger) add:(NSInteger)a and:(NSInteger)b {
    return a + b;
}

+ (NSString*) connect:(NSString *)str1 and:(NSString *)str2 {
    return [NSString stringWithFormat:@"%@ %@", str1, str2];
}

#pragma mark - 自定义UIView
+ (UIView*) CreatMyView:(CGRect)frame{
    UIView * viewT=[[UIView alloc] initWithFrame:frame];
    viewT.backgroundColor=[UIColor colorWithWhite:0.870 alpha:1.000];
    //UIView设置阴影
    [[viewT layer] setShadowOffset:CGSizeMake(1, 1)];
    [[viewT layer] setShadowRadius:5];
    [[viewT layer] setShadowOpacity:1];
    [[viewT layer] setShadowColor:[UIColor blackColor].CGColor];
    //UIView设置边框
    [[viewT layer] setCornerRadius:5];
    [[viewT layer] setBorderWidth:1];
    [[viewT layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    return viewT;
}


#pragma mark - 0:普通带边框Lab ;1:带虚线边框Lab

+ (UILabel*) CreatMyLab:(CGRect)frame :(NSString *)str :(UIColor *)bgcolor :(UIColor *)linecolor :(int)Type
{
    
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    
    switch (Type) {
        case 0:
            [lab.layer setMasksToBounds:YES];
            [lab.layer setCornerRadius:5.0];
            [lab.layer setBorderWidth:1.0];
            [lab.layer setBorderColor:linecolor.CGColor];
            [lab setBackgroundColor:bgcolor];
            lab.textAlignment = NSTextAlignmentCenter;
            break;
        case 1:
            if (Type ==1) {
                [lab.layer setMasksToBounds:YES];
                [lab.layer setCornerRadius:3.0];
                [lab setBackgroundColor:bgcolor];
                
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, lab.frame.size.width, lab.frame.size.height)];
                view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0];
                //        view.layer.cornerRadius = CGRectGetWidth(view.bounds)/2;
                CAShapeLayer *borderLayer = [CAShapeLayer layer];
                borderLayer.bounds = CGRectMake(10, 10, lab.frame.size.width, lab.frame.size.height);
                borderLayer.position = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
                
                //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
                borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
                borderLayer.lineWidth = 2. / [[UIScreen mainScreen] scale];
                //虚线边框
                borderLayer.lineDashPattern = @[@3, @3];
                //实线边框
                //    borderLayer.lineDashPattern = nil;
                borderLayer.fillColor = [UIColor clearColor].CGColor;
                borderLayer.strokeColor = linecolor.CGColor;
                [view.layer addSublayer:borderLayer];
                
                [lab  addSubview:view];
            }
            break;
            
        default:
            break;
    }
    return lab;
    
}

#pragma mark - 0:普通带边框Btn;1:带虚线边框Btn

+ (UIButton*) CreatMyBtn:(CGRect)frame :(NSString *)str :(UIColor *)bgcolor :(UIColor *)linecolor :(int)Type
{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    
    switch (Type) {
        case 0:
            [btn.layer setMasksToBounds:YES];
            [btn.layer setCornerRadius:5.0];
            [btn.layer setBorderWidth:1.0];
            [btn.layer setBorderColor:linecolor.CGColor];
            [btn setBackgroundColor:bgcolor];
            break;
        case 1:
            if (Type ==1) {
                [btn.layer setMasksToBounds:YES];
                [btn.layer setCornerRadius:3.0];
                [btn setBackgroundColor:bgcolor];
                
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height)];
                view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0];
                //        view.layer.cornerRadius = CGRectGetWidth(view.bounds)/2;
                CAShapeLayer *borderLayer = [CAShapeLayer layer];
                borderLayer.bounds = CGRectMake(10, 10, btn.frame.size.width, btn.frame.size.height);
                borderLayer.position = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
                
                //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
                borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
                borderLayer.lineWidth = 2. / [[UIScreen mainScreen] scale];
                //虚线边框
                borderLayer.lineDashPattern = @[@3, @3];
                //实线边框
                //    borderLayer.lineDashPattern = nil;
                borderLayer.fillColor = [UIColor clearColor].CGColor;
                borderLayer.strokeColor = linecolor.CGColor;
                [view.layer addSublayer:borderLayer];
                
                [btn  addSubview:view];
            }
            break;
            
        default:
            break;
    }
    return btn;
    
}

#pragma mark -fontello_UIButton/fontello_UILabel

/**
 *  0:fontello_UILabel
 */

+ (UILabel*) CreatFontelloLab:(CGRect)frame :(NSString *)str :(UIFont *)font :(UIColor *)fontColor :(int)Type
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    
    if (Type ==0) {
        lab.font = font;
        lab.text = str;
        lab.textColor = fontColor;
    }
    
    return lab;
}
+ (UIButton*) CreatFontelloBtn:(CGRect)frame :(NSString *)str :(UIFont *)font :(UIColor *)fontColor :(int)Type
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.tag = Type;
    Btn.frame = frame;
    Btn.titleLabel.font = font;
    [Btn setTitle:str forState:UIControlStateNormal];
    Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [Btn setTitleColor:fontColor forState:UIControlStateNormal];
    return Btn;
}

#pragma mark -带小红点的button

//显示小红点
+ (void)UIButtonShowBadgeOnItemIndex:(id)sender{
    //移除之前的小红点
    [self UIButtonRemoveBadgeOnItemIndex:sender];
    
    UIButton *btn = (UIButton *)sender;
    if(btn.tag ==0){
        return;
        
    }
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + [sender tag];
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = btn.frame;
    
    
    if ([btn tag] == 0 ) {
        return;
    }
    //确定小红点的位置
    
    float percentX = btn.frame.size.width-10;
    CGFloat x = ceilf(percentX);
    CGFloat y = ceilf(0.1 * tabFrame.size.height
                      );
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:badgeView.frame];
    lab.backgroundColor = [UIColor clearColor];
    
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor whiteColor];
    
    if ([btn tag]<99) {
        lab.text = [NSString stringWithFormat:@"%ld",(long)[btn tag]];
        lab.font = [UIFont fontWithName:@"Arial" size:10];
    }
    else
    {
        lab.text = @"···";
        lab.font = [UIFont fontWithName:@"Arial" size:10];
    }
    
    [btn addSubview:badgeView];
    [btn addSubview:lab];

    
    
    
}

//隐藏小红点
+ (void)UIButtonHideBadgeOnItemIndex:(id)sender{
    //移除小红点
    [self UIButtonRemoveBadgeOnItemIndex:sender];
}

//移除小红点
+ (void)UIButtonRemoveBadgeOnItemIndex:(id)index{
    //按照tag值进行移除
    UIButton *btn = (UIButton *)index;
    for (UIView *subView in btn.subviews) {
        if (subView.tag == 888+[index tag]) {
            [subView removeFromSuperview];
        }
    }
}


#pragma mark -带小红点的TabBar
//显示小红点
+ (void)UITabBarShowBadgeOnItemIndex:(id)sender :(int)index :(int)Num{
    
    UITabBar *Tar = (UITabBar *)sender;
    //移除之前的小红点
    [self UITabBarRemoveBadgeOnItemIndex:sender:index:Num];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 4;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = Tar.frame;
    
    //确定小红点的位置
    float percentX = (index +0.6) / Num;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 8, 8);//圆形大小为10
    [Tar addSubview:badgeView];
}

//隐藏小红点
+ (void)UITabBarHideBadgeOnItemIndex:(id)sender :(int)index :(int)Num
{
    //移除小红点t)index{
    [self UITabBarRemoveBadgeOnItemIndex:sender:index:Num];
}

//移除小红点
+ (void)UITabBarRemoveBadgeOnItemIndex:(id)sender :(int)index :(int)Num{
    //按照tag值进行移除
    UITabBar *Tar = (UITabBar *)sender;
    for (UIView *subView in Tar.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
    
}


#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark - 数据类型的判断
//判断是否为整型：
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}
//判断是否为浮点型：
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}


+ (NSString *)changePrice:(NSString *)price
{
    NSString *result = @"";
    
    if([price intValue]/100 <1)
    {
        NSString *jfbString=[NSString stringWithFormat:@"%.2f",(double)[price doubleValue]/100];
        result =[NSString stringWithFormat:@"%.2f",[jfbString doubleValue]];;
        
    }
    else
    {
        NSString *jfbString=[NSString stringWithFormat:@"%.2f",(double)[price doubleValue]/100];
        
        
        if ([jfbString  doubleValue]==[jfbString   integerValue])
        {
            result =[NSString stringWithFormat:@"%.2f",[jfbString doubleValue]];
            
        }else{
            result =[NSString stringWithFormat:@"%.2f",[jfbString doubleValue]];
        }
    }
    
    return  result;
    
}

+ (NSString *)changePriceWithYang:(NSString *)price
{
    NSString *result = @"";
    
    if([price intValue]/100 <1)
    {
        NSString *jfbString=[NSString stringWithFormat:@"%.2f",(double)[price doubleValue]/100];
        result =[NSString stringWithFormat:@"¥%.2f",[jfbString doubleValue]];;
        
    }
    else
    {
        NSString *jfbString=[NSString stringWithFormat:@"%.2f",(double)[price doubleValue]/100];
        
        
        if ([jfbString  doubleValue]==[jfbString   integerValue])
        {
            result =[NSString stringWithFormat:@"¥%.2f",[jfbString doubleValue]];
            
        }else{
            result =[NSString stringWithFormat:@"¥%.2f",[jfbString doubleValue]];
        }
    }
    
    return  result;
    
}


+ (BOOL)isNetworkEnabled
{
    BOOL bEnabled = FALSE;
    NSString *url = @"www.baidu.com";
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [url UTF8String]);
    SCNetworkReachabilityFlags flags;
    
    bEnabled = SCNetworkReachabilityGetFlags(ref, &flags);
    
    CFRelease(ref);
    if (bEnabled) {
        //        kSCNetworkReachabilityFlagsReachable：能够连接网络
        //        kSCNetworkReachabilityFlagsConnectionRequired：能够连接网络，但是首先得建立连接过程
        //        kSCNetworkReachabilityFlagsIsWWAN：判断是否通过蜂窝网覆盖的连接，比如EDGE，GPRS或者目前的3G.主要是区别通过WiFi的连接。
        BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
        bEnabled = ((flagsReachable && !connectionRequired) || nonWiFi) ? YES : NO;
    }
    return bEnabled;
}

+ (NSString *)GetDeviceToken
{
    NSUUID *UUID = [NSUUID UUID];
    NSString *UUIDString = UUID.UUIDString;
    NSLog(@"Original UUID:\t%@", UUIDString);
    return UUIDString;
}

+ (NSString *)string:(id)sender
{
    NSString *str = [NSString stringWithFormat:@"%@",sender];
    return str;
}

+ (CGFloat)MyW{
    return [UIScreen mainScreen].bounds.size.width;
}
+ (CGFloat)MyH{
    return [UIScreen mainScreen].bounds.size.height;
}
+ (CGFloat)MyX{
    return [UIScreen mainScreen].bounds.origin.x;
}
+ (CGFloat)MyY{
    return [UIScreen mainScreen].bounds.origin.y;
}
+ (CGRect)MyFrame{
    return [UIScreen mainScreen].bounds;
}

+ (CGSize)sizeWithString:(NSString *)str :(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


+ (NSMutableAttributedString *)changeText:(NSString *)sender :(UIFont *)font :(UIColor *)color
{
    NSAttributedString *str1 = [[NSAttributedString alloc]initWithString:sender];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithAttributedString:str1];
    if ([sender rangeOfString:@"¥"].location != NSNotFound) {
        [text addAttribute:NSFontAttributeName value:font range:NSMakeRange ([sender rangeOfString:@"¥"].location, 1)];
    }
    
    if ([sender rangeOfString:@"."].location != NSNotFound) {
        [text addAttribute:NSFontAttributeName value:font range:NSMakeRange ([sender rangeOfString:@"."].location+1, 2)];
    }
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange (0, 1)];
    return text;
}

+ (NSMutableAttributedString *)changeTextWithYang:(NSString *)sender :(UIFont *)font :(UIColor *)color
{
    sender = [NSString stringWithFormat:@"¥%@", sender];
    NSAttributedString *str1 = [[NSAttributedString alloc]initWithString:sender];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithAttributedString:str1];
    if ([sender rangeOfString:@"¥"].location != NSNotFound) {
        [text addAttribute:NSFontAttributeName value:font range:NSMakeRange ([sender rangeOfString:@"¥"].location, 1)];
    }
    
    if ([sender rangeOfString:@"."].location != NSNotFound) {
        [text addAttribute:NSFontAttributeName value:font range:NSMakeRange ([sender rangeOfString:@"."].location+1, 2)];
    }
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange (0, 1)];
    return text;
}

+ (NSMutableArray *)idleImages
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (NSUInteger i = 1; i<=27; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [arr addObject:image];
    }
    return arr;
}

+ (NSMutableArray *)refreshingImages
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (NSUInteger i = 1; i<=8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_00%zd", i]];
        [arr addObject:image];
    }
    return arr;
}

+ (NSMutableArray *)pullingImages
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSUInteger i = 1; i<=8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_00%zd", i]];
        [arr addObject:image];
    }
    return arr;
}


+ (NSString *)PhoneNumFormat:(NSString *)phone{
    NSString *numStr = [NSString stringWithFormat:@"%@",phone];
    if (numStr.length >= 11) {
        NSString *str1 = [numStr substringWithRange:NSMakeRange(0,3)];
        NSString *str2 = [numStr substringWithRange:NSMakeRange(3,4)];
        NSString *str3 = [numStr substringWithRange:NSMakeRange(7,4)];
        numStr = [NSString stringWithFormat:@"%@-%@-%@",str1,str2,str3];
    } else {
        numStr = numStr;
    }
    return numStr;
}




+ (UIViewController *)appRootViewController;
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}



+ (UIView *)isNetWork
{
    UIView *im = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    im.isNetWork = YES;
    return im;
}


+ (UIImageView *)circleImageView: (CGRect)frame : (UIColor *)circleColor :(UIImage *)image{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = image;
    
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    imageView.clipsToBounds = YES;
    
    //设置layer
    CALayer *layer=[imageView layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    //设置边框线的宽
    [layer setBorderWidth:1];
    //设置边框线的颜色
    [layer setBorderColor:[circleColor CGColor]];
    
    return imageView;
    
}


+ (BOOL)Compare:(NSDate *)date1 with:(NSDate *)date2{
    
    NSDate *Nowdate = date1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps1;
    NSDateComponents *comps2;
    comps1 =[calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                        fromDate:Nowdate];
    comps2 =[calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                        fromDate:date2];
 
    
    if ([comps1 day] == [comps2 day] && [comps1 month] == [comps2 month] && [comps1 year] == [comps2 year]) {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isNull:(id)data {
    if ([NSString stringWithFormat:@"%@", data].length <= 0 || [data isEqual:[NSNull null]] || [[NSString stringWithFormat:@"%@", data] isEqualToString:@"(null)"] || [[NSString stringWithFormat:@"%@", data] isEqualToString:@"{}"]) {
        return YES;
    } else {
        return NO;
    }
}

@end
