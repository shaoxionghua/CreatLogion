//
//  RootViewController.h
//  快速集成注册登录页面
//
//  Created by danggui on 2016/10/31.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *push;

- (IBAction)pushLogin:(id)sender;
@end
