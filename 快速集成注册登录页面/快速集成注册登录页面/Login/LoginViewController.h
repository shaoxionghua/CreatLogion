//
//  LoginViewController.h
//  快速集成注册登录页面
//
//  Created by danggui on 2016/10/31.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "General.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic, assign)BOOL isFirstLogin;

@end
