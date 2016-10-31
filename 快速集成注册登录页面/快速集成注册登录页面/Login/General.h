//
//  General.h
//  快速集成注册登录页面
//
//  Created by danggui on 2016/10/31.
//  Copyright © 2016年 danggui. All rights reserved.
//

#ifndef ___Pro_General_h
#define ___Pro_General_h


//判断系统版本
#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 &&[[[UIDevice currentDevice] systemVersion] floatValue] <=8.0 ? YES : NO)
#define IsIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)
#define IsIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0 ? YES : NO)

//在主线程或在后台执行block
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height//获取屏幕高度，兼容性测试
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width//获取屏幕宽度，兼容性测试

#define ScreenHeightAuto [[UIScreen mainScreen] bounds].size.height /568 //获取屏幕高度，兼容性测试
#define ScreenWidthAuto [[UIScreen mainScreen] bounds].size.width /320 //获取屏幕宽度，兼容性测试

#define Key_autoW (ScreenWidth / 375) // iPhone 6
#define Key_autoH (ScreenHeight / 667) // iPhone 6


#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


#define WINDOW_COLOR                            [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]

#define AutoWH (16/9)
//判断设备型号
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//版本信息发布需要修改的参数
#define clientVersion @"2000000001"

#define Version @"2.0.0"

#define AppStoreRelease @"1"//为1的话是发布到appStore


#define AppEnvironment [[[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"]] objectForKey:@"AppEnvironment"]

#define someThing ([AppEnvironment isEqualToString:@"D"])?
#define someThing1 ([AppEnvironment isEqualToString:@"T"])?
#define someThing2 ([AppEnvironment isEqualToString:@"P"])?
#define someThing3 ([AppEnvironment isEqualToString:@"R"])?

#define NewReleaseURL [[GetUrl getInstance] getUrl]


//判断设备信息
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

//配色方案
#define ViewBgColor @"f0f0f0"//灰色
#define NavBgColor @"faaf3c"//橘黄色

#define NavColor @"f8f8f7"//导航栏颜色
#define NavtitleColor @"1d1d1d"//导航栏标题颜色
#define NavBtnColor @"ffa61e"//导航栏按钮颜色
#define PriceColor @"ff6600"//导航栏按钮颜色

#define ffa61e @"ffa61e"//导航栏按钮颜色
#define ff6600 @"ff6600"//导航栏按钮颜色
#define f9f9f9 @"f9f9f9"//页面背景颜色

#define KeyDefAddressCellBG [MyLib colorWithHexString:@"ffefe6"]// 默认联系人地址cell上背景色
#define KeyDefAddressCellFootBG [MyLib colorWithHexString:@"fff0e2"]// 默认联系人地址cell背景色

#define timeBtnColor @"92ce52"
#define timeBgColor @"f2f2f2"
#define logoutBgColor @"be282d"
#define imagefont @"iconmoon"
#define imagefont1 @"fontello"
#define imagefont_masco @"icon_masco"
#define lineColor @"be282d"

//#define Key_NowDeBugColor [UIColor colorWithRed:arc4random() % 251 / 250.0 green:arc4random() % 251 / 250.0 blue:arc4random() % 251 / 250.0 alpha:1.0] // 调试使用的随机色
#define Key_NowDeBugColor [UIColor clearColor]
// 杏仁标准 背景色 Head
#define key_BgColor00 [MyLib colorWithHexString:@"000000"] // 黑
#define key_BgColor1D [MyLib colorWithHexString:@"1d1d1d"] // 高黑
#define key_BgColor4D [MyLib colorWithHexString:@"4d4d4d"] // 常用灰
#define key_BgColorF0 [MyLib colorWithHexString:@"f0f0f0"] // 老版本灰色
#define key_BgColorF2 [MyLib colorWithHexString:@"f2f2f2"] // 常用背景色
#define key_BgColorF9 [MyLib colorWithHexString:@"f9f9f9"] // 一般是标题栏背景 浅色背景
#define key_BgColorFF [MyLib colorWithHexString:@"ffffff"] // 白色
#define key_BgColorD9 [MyLib colorWithHexString:@"d9d9d9"] // 分割线颜色
#define key_BgColorC8 [MyLib colorWithHexString:@"c8c8c7"] // 浅色背景分割线
#define key_BgColorB2 [MyLib colorWithHexString:@"b2b2b2"] // 无情感 图飘色  多用于不可用或 无效 提示 A 略深
#define key_BgColorD2 [MyLib colorWithHexString:@"d2d2d2"] // 无情感 图飘色  多用于不可用或 无效 提示 B 略浅
#define key_BgColorFE [MyLib colorWithHexString:@"ffefe6"]
#define key_BgColor30 [MyLib colorWithHexString:@"330000"]
#define key_BgColor7F [MyLib colorWithHexString:@"7f0000"]
#define key_BgColorF7 [MyLib colorWithHexString:@"fffff7"] // 新登录背景色
// 字体提示色
#define key_BgColor66 [MyLib colorWithHexString:@"666666"] // 深色字体 中灰
#define key_BgColor88 [MyLib colorWithHexString:@"888888"] // 字体 浅灰
// 橙色
#define key_BgColorF6E [MyLib colorWithHexString:@"ffa61e"] // 企业色 浅橙色
#define key_BgColorF60 [MyLib colorWithHexString:@"ff6600"] //亮橙色 比企业色要 亮 多用于 钱
//辅助红
#define key_BgColorRED [MyLib colorWithHexString:@"be282d"]
// 辅助 奶色 背景
#define key_BgColor62 [MyLib colorWithHexString:@"ffefe6"]
//#define key_BgColor6f [MyLib colorWithHexString:@"66ffff"]

// 辅助 橙色 背景
#define key_BgColorFAE [MyLib colorWithHexString:@"faeac0"]
// 蓝色
#define key_BgColor4A [MyLib colorWithHexString:@"4a90e2"]


#define Key_DeBugColor [UIColor colorWithRed:arc4random() % 251 / 250.0 green:arc4random() % 251 / 250.0 blue:arc4random() % 251 / 250.0 alpha:1.0] // 调试使用的随机色

#define systemFont @"HelveticaNeue"
#define systemFontLight @"HelveticaNeue-Light"
#define systemFontBold @"HelveticaNeue-Bold"

#define systemFontItalic @"HelveticaNeue-Italic"
#define systemFontUltraLight @"HelveticaNeue-UltraLight"
#define systemFontCondensedBlack @"HelveticaNeue-CondensedBlack"
#define systemFontBoldItalic @"HelveticaNeue-BoldItalic"
#define systemFontCondensedBold @"HelveticaNeue-CondensedBold"
#define systemFontMedium @"HelveticaNeue-Medium"


#define labFont [UIFont fontWithName:imagefont size: 13];


//个人信息数据字段
#define DATA_FILE @"PersonInfo"
#define TABLE_NAME @"PersonInfo"
#define FIELDS_NAME_ID @"ID"
#define FIELDS_NAME_userID @"userID"
#define FIELDS_NAME_LoginTAG @"isLogin"
#define FIELDS_NAME_AvatarUrl @"avatarUrl"
#define FIELDS_NAME_CellPhoneNum @"cellPhoneNumber"
#define FIELDS_NAME_Level @"level"
#define FIELDS_NAME_NickName @"nickName"

//一些提示文案
#define NetError @"网络连接失败,稍后再试"
#define HadNoDate @"下边木有了  ( O - O )"
//一些常用判断
#define ServiceKey @"com.1kf.1kf.LLS"
#define ISLOGIN [[UICKeyChainStore stringForKey:@"1kf_login" service:ServiceKey] isEqualToString:@"loginSucceed"] //判断已经登录



//通用类
#import "MyLib.h"
#import "Toast.h"

//第三方类库
#import <SVProgressHUD/SVProgressHUD.h>
#import <SDAutoLayout/UIView+SDAutoLayout.h>
#import <SDAutoLayout/UITableView+SDAutoTableViewCellHeight.h>
#import <CoreText/CoreText.h>
#import "NSString+WPAttributedMarkup.h"
#import "WPAttributedStyleAction.h"
#import "WPHotspotLabel.h"
#import "UIView+SDAutoLayout.h"
#import "MJExtension.h"
#import "IQKeyboardManager.h"
#import <STPopup/STPopup.h>


#define Key_ScreenHeight [[UIScreen mainScreen] bounds].size.height//获取屏幕高度，兼容性测试
#define Key_ScreenWidth [[UIScreen mainScreen] bounds].size.width//获取屏幕宽度，兼容性测试
#define Key_BuuH 450 // 记录 弹出的视图 高度
#define Key_AutoH (Key_ScreenHeight / 667) //  6 屏幕高度 比例
#define key_AutoW (Key_ScreenWidth / 375) //  6 屏幕宽度 比例



// device verson float value
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS7orLater IOS_VERSION>=7.0

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//透明背景色
#define CLEARCOLOR [UIColor clearColor]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#pragma mark - 当前工程所用的到背景颜色
#define MBackgroundColor RGBCOLOR(240, 240, 240)


#define FSLocalizedString(key) (([CurrentLanguage rangeOfString:@"zh-Hans"].length || [CurrentLanguage rangeOfString:@"de"].length || [CurrentLanguage rangeOfString:@"fr"].length || [CurrentLanguage rangeOfString:@"es"].length)?([[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]):([[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"]] localizedStringForKey:key value:@"" table:nil]))

// Size
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

// iPad
#define kIsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kIs_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhone_6 (kIs_iPhone && SCREEN_HEIGHT == 667.0)
#define kIs_iPhone_6P (kIs_iPhone && SCREEN_HEIGHT == 736.0)

// block
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };
/*
 // 宏定义之前的用法
 if (completionBlock)   {
 completionBlock(arg1, arg2);
 }
 // 宏定义之后的用法
 BLOCK_EXEC(completionBlock, arg1, arg2);
 */
// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

//  MRC和ARC混编设置方式
/*
 在XCode中targets的build phases选项下Compile Sources下选择 不需要arc编译的文件
 双击输入 -fno-objc-arc 即可
 
 MRC工程中也可以使用ARC的类，方法如下：
 在XCode中targets的build phases选项下Compile Sources下选择要使用arc编译的文件
 双击输入 -fobjc-arc 即可
 */


//1 去除release的NSLog
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

//3 日志宏，用DEBUG开关管理，只有在DEBUG模式下才让日志输出
#ifdef DEBUG
#define LOG(fmt, ...) do {                                                  \
NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__];         \
NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__); \
[file release];                                                             \
} while(0)
#define LOG_METHOD NSLog(@"%@/%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#define COUNT(p) NSLog(@"%s(%d): count = %d\n", __func__, __LINE__, [p retainCount]);
#define LOG_TRACE(x) do {printf x; putchar('\n'); fflush(stdout);} while (0)
# else
#define LOG(...)
#define LOG_METHOD
#define COUNT(p)
#define LOG_TRACE(x)
#endif

//4 计算方法耗时时间间隔
#define TICK   CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCK   NSLog(@"{%@/%@}^{Time_Consuming: %f}", NSStringFromClass([self class]), NSStringFromSelector(_cmd), CFAbsoluteTimeGetCurrent() - start);

//5 区分真机模拟器的时候务必用TARGET_IPHONE_SIMULATOR来判断
/*
 TARGET_IPHONE_SIMULATOR和TARGET_OS_IPHONE 是苹果的两个宏定义，
 在真机sdk中位于ios->usr/include/targetconditionals.h中，
 在模拟器sdk中位于simulator->usr/include/targetconditionals.h中
 
 模拟器sdk中的定义：
 #define TARGET_OS_IPHONE            1
 #define TARGET_IPHONE_SIMULATOR     1
 
 真机sdk中的定义：
 
 #define TARGET_OS_IPHONE            1
 #define TARGET_IPHONE_SIMULATOR     0
 */
#if TARGET_IPHONE_SIMULATOR//模拟器
#define SIMULATOR 1
#elif TARGET_OS_IPHONE//真机
#define SIMULATOR 0
#endif

#define showModelContent(model) [AssistantTool dictionaryFromModel:model]
#define showDicProperty(dic) [AssistantTool writeInfoWithDict:dic]







#endif

