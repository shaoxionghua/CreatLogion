//
//  LoginViewController.m
//  快速集成注册登录页面
//
//  Created by danggui on 2016/10/31.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import "LoginViewController.h"
#import "RemarkViewController.h"

@interface LoginViewController ()
{
    UINavigationBar *bar;
    UIView *rootView;
    UIButton *VerCode;
    UITextField *phoneNum;
    UITextField *passwordNum;
    UIButton *logionBtn;
    UILabel *canNotGetYZMLab;
    dispatch_queue_t queue;
}
@property (nonatomic, assign) BOOL isTimeing; // 是否正在倒计时
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSelfNav];
    self.isTimeing = NO;
    
    
//    这里可以设置返回按钮是否显示
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.rightBarButtonItem.customView.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)initSelfNav
{
    self.view.backgroundColor = key_BgColorF7;
    self.navigationController.navigationBar.hidden = YES;
    bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    bar.shadowImage = [UIImage new];
    bar.translucent = YES;
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"登录"];
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:key_BgColor1D}];
//    //UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
//    left = [MyLib CreatFontelloBtn:CGRectMake(0, 0, 60, 32) :@"\U00001601" :[UIFont fontWithName:imagefont size:16] :key_BgColorF6E:1];
//    left.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [left addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:left];
//    [item setLeftBarButtonItem:leftButton];
    [bar pushNavigationItem:item animated:NO];
    [self.view sd_addSubviews:@[bar]];
    [self initWidgte];
}

- (void)back{
    if (self.isFirstLogin) {
//        RootViewController *root = [[RootViewController alloc]init];
//        //self.hidesBottomBarWhenPushed = NO;
//        //[self.navigationController pushViewController:root animated:YES];
//        MyUINavigationController *aaNav = [[MyUINavigationController alloc] initWithRootViewController:root];
//        
        //UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
        //window.rootViewController = aaNav;
        
        
//        self.view.window.rootViewController = aaNav;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)initWidgte
{
    UIView *view1 = [UIView new]; // 装 手机号的View
    UIView *view2 = [UIView new]; // 装 验证码的 View
    canNotGetYZMLab = [UILabel new];
    logionBtn = [UIButton new];
    WPHotspotLabel *baoXian = [WPHotspotLabel new];// 保险
    [self.view sd_addSubviews:@[view1, view2, canNotGetYZMLab, logionBtn, baoXian]];
    view1.sd_layout
    .topSpaceToView(self.view, 119)
    .centerXEqualToView(self.view)
    .widthIs(260)
    .heightIs(42);
    //view1.backgroundColor = Key_DeBugColor;
   
    view2.sd_layout
    .topSpaceToView(view1, 29)
    .centerXEqualToView(view1)
    .widthIs(260)
    .heightIs(42);
    //view2.backgroundColor = Key_DeBugColor;
    
    canNotGetYZMLab.sd_layout
    .topSpaceToView(view2, 0)
    .leftEqualToView(view2)
    .widthIs(260)
    .heightIs(33);
    //canNotGetYZMLab.backgroundColor = Key_DeBugColor;
    canNotGetYZMLab.textColor = key_BgColorB2;
    canNotGetYZMLab.text = @"收不到验证码?";
    canNotGetYZMLab.font = [UIFont systemFontOfSize:12.f];
    
    logionBtn.sd_layout
    .topSpaceToView(view2, 90)
    .leftEqualToView(view2)
    .widthIs(260)
    .heightIs(44);
    [logionBtn setBackgroundColor:key_BgColorB2];
    [logionBtn setTintColor:key_BgColorFE];
    [logionBtn setTitle:@"使用" forState:UIControlStateNormal];
    logionBtn.layer.masksToBounds = YES;
    logionBtn.layer.cornerRadius = 3;
    
    baoXian.sd_layout
    .bottomSpaceToView(self.view, 14)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(40);
    //baoXian.backgroundColor = Key_DeBugColor;
    
    //view1 布局
    UILabel *Lab86 = [UILabel new];
    UILabel *oneLinLab = [UILabel new];// +86 和 手机号之间的竖线
    phoneNum = [UITextField new];
    [phoneNum setTintColor:[UIColor colorWithRed:1.0 green:0.651 blue:0.1176 alpha:1.0]];
    VerCode = [UIButton new];
    UILabel *oneLinLab2 = [UILabel new];// 手机号 下面的线
    [view1 sd_addSubviews:@[Lab86, oneLinLab, phoneNum, VerCode, oneLinLab2]];
    Lab86.sd_layout
    .leftSpaceToView(view1, 0)
    .topSpaceToView(view1, 0)
    .widthIs(45)
    .heightIs(42);
    Lab86.text = @"+86";
    //Lab86.backgroundColor = Key_DeBugColor;
    Lab86.font = [UIFont systemFontOfSize:16.f];
    Lab86.textColor = key_BgColorB2;
    
    oneLinLab.sd_layout
    .leftSpaceToView(Lab86, 0)
    .centerYEqualToView(view1)
    .widthIs(1)
    .heightIs(20);
    oneLinLab.backgroundColor = key_BgColorD9;
    
    VerCode.sd_layout
    .rightSpaceToView(view1, 0)
    .centerYEqualToView(view1)
    .widthIs(40)
    .heightIs(24);
    [VerCode setTitle:@"验证" forState:UIControlStateNormal];
    [VerCode setTitleColor:key_BgColorFF forState:UIControlStateNormal];
    VerCode.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [VerCode setBackgroundColor:key_BgColorB2];
    VerCode.layer.cornerRadius = 3;
    VerCode.layer.masksToBounds = YES;
    
    phoneNum.sd_layout
    .leftSpaceToView(oneLinLab, 1)
    .rightSpaceToView(VerCode, 6)
    .topSpaceToView(view1, 0)
    .heightIs(42);
    phoneNum.placeholder = @"请输入手机号";
    //phoneNum.backgroundColor = Key_DeBugColor;
    phoneNum.textAlignment = NSTextAlignmentCenter;
    phoneNum.font = [UIFont systemFontOfSize:16.f];
    phoneNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    oneLinLab2.sd_layout
    .leftSpaceToView(view1, 0)
    .rightSpaceToView(view1, 0)
    .bottomSpaceToView(view1, 0)
    .heightIs(0.5);
    oneLinLab2.backgroundColor = key_BgColorD9;
    // view2 布局
    UILabel *oneLinLab3 = [UILabel new];
    passwordNum = [UITextField new];
    [passwordNum setTintColor:[UIColor colorWithRed:1.0 green:0.651 blue:0.1176 alpha:1.0]];
    [view2 sd_addSubviews:@[passwordNum, oneLinLab3]];
    passwordNum.sd_layout
    .leftSpaceToView(view2, 46)
    .rightSpaceToView(view2, 46)
    .topSpaceToView(view2, 0)
    .bottomSpaceToView(view2, 0);
    passwordNum.textAlignment = NSTextAlignmentCenter;
    passwordNum.placeholder = @"请输入验证码";
    passwordNum.textColor = key_BgColor1D;
    passwordNum.font = [UIFont systemFontOfSize:16.f];
    oneLinLab3.sd_layout
    .leftSpaceToView(view2, 0)
    .rightSpaceToView(view2, 0)
    .bottomSpaceToView(view2, 0)
    .heightIs(0.5);
    oneLinLab3.backgroundColor = key_BgColorD9;
    
    NSString *str = @"点击开始使用,即表示您同意服务条款及隐私条款";
    float tw =[self widthForString:str fontSize:14 andHeight:20];
    tw =([UIScreen mainScreen].bounds.size.width-tw)/2;
    
    NSDictionary* style3 = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:12.0],
                             @"help":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"Help action");
                                 
                                 RemarkViewController *remark = [[RemarkViewController alloc]init];
                                 remark.type =0;
                                 [self.navigationController pushViewController:remark animated:YES];
                             }],
                             @"settings":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"Settings action");
                                 
                                 RemarkViewController *remark = [[RemarkViewController alloc]init];
                                 remark.type = 1;
                                 [self.navigationController pushViewController:remark animated:YES];
                             }],
                             @"link": key_BgColorF6E};
    
    baoXian.textAlignment = NSTextAlignmentCenter;
    baoXian.textColor = key_BgColor4D;
    baoXian.attributedText = [@"点击开始使用,即表示您同意<help>服务条款</help>及<settings>隐私条款</settings>" attributedStringWithStyleBook:style3];
//    baoXian.hidden = YES;
    phoneNum.tag = 401;
    phoneNum.delegate = self;
    passwordNum.tag = 402;
    passwordNum.delegate = self;
    VerCode.enabled = NO;
    logionBtn.enabled = NO;
    [VerCode addTarget:self action:@selector(gotoCapt:) forControlEvents:UIControlEventTouchUpInside];
    [logionBtn addTarget:self action:@selector(gotoLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *callForCaptTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoVoiceCapt:)];
    canNotGetYZMLab.userInteractionEnabled = NO;
    [canNotGetYZMLab addGestureRecognizer:callForCaptTap];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    //[defaults setValue:phoneNum.text forKey:@"myPhoneNum"];
    NSString *myPhoneNum = [defaults valueForKey:@"myPhoneNum"];
    NSString *mobileText = @"";
    if (myPhoneNum != nil) {
        mobileText = [MyLib string:myPhoneNum];
    }
    //NSString *mobileText = [MyLib string:[UICKeyChainStore stringForKey:@"1kf_phoneNum" service:ServiceKey]];
    // 这里
    if (mobileText.length == 11) {
        phoneNum.text = mobileText;
        VerCode.enabled = YES;
        VerCode.backgroundColor = key_BgColorF6E;
    }
}

//获取字符串的宽度
-(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:fontSize]};
    // NSString class method: boundingRectWithSize:options:attributes:context is
    // available only on ios7.0 sdk.
    CGRect rect = [value boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
    return rect.size.width;
}

-(void)startTime{
    self.isTimeing = YES;
    __block int timeout = 60; //倒计时时间 60s
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.isTimeing = NO;
                [VerCode setTitle:@"验证" forState:UIControlStateNormal];
                if (phoneNum.text.length > 0) {
                    [VerCode setBackgroundColor:key_BgColorF6E];
                    VerCode.enabled = YES;
                }
            });
        }else{
            int seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [VerCode setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                VerCode.enabled = NO;
                [VerCode setBackgroundColor:key_BgColorB2];
                if (timeout == 50) {
                    canNotGetYZMLab.userInteractionEnabled = YES;
                    canNotGetYZMLab.textColor = key_BgColorF6E;
                }
                if (phoneNum.text.length == 0) {
                    timeout = 0;
                    passwordNum.text = @"";
                }
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark - 登录相关
- (void)gotoLogin:(UIButton *)btn
{
    if ([phoneNum.text length] ==0 ||[passwordNum.text length] ==0) {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"用户名或者验证码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alt show];
        return;
    }
    //这里去执行登录的接口调用和数据回调的处理
    //dosomething
}

- (void)gotoCapt:(UIButton *)btn
{
    NSLog(@"发送验证码");
    VerCode.enabled = NO;
    if ([phoneNum.text length] ==0 || [phoneNum.text length]!=11) {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请输入正确的手机号码！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alt show];
        return;
    }
    
    if ([phoneNum.text length] != 0 && [phoneNum.text length]== 11) {
    }
    
    //这里去执行获取验证码的接口调用和数据回调的处理
    //dosomething
    
    [Toast showWithText:@"验证码发送成功" duration:1.0];
    [self startTime];
    
}

- (void)regDeviceToken
{

}

- (void)gotoVoiceCapt:(UIButton *)btn
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您将要通过接听电话获取验证码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }else if(buttonIndex == 1){
        if ([phoneNum.text length] ==0 ) {
            UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请输入手机号码！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alt show];
            return;
        }
        
        if ([phoneNum.text length]!=11) {
            UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请输入正确的手机号码!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alt show];
            return;
        }

    }
}



#pragma mark - textField 隐藏键盘和完成编辑
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [phoneNum resignFirstResponder];
    [passwordNum resignFirstResponder];
    
    return YES;
}

////隐藏键盘--点击屏幕任何地方隐藏
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [phoneNum resignFirstResponder];
//    [passwordNum resignFirstResponder];
//}
//键盘出现 上移界面
- (void)textFieldDidBeginEditing:(UITextField *)textField
{

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

//限制手机号11位 验证码6位
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]){
        return YES;
    }
    
    NSString * aString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (phoneNum == textField)
    {
        if ([aString length] > 11) {
            textField.text = [aString substringToIndex:11];
            return NO;
        }
        // 如果 验证码有的 而且手机号 是有的
        if (aString.length > 0 && self.isTimeing == NO) {
            VerCode.backgroundColor = key_BgColorF6E;
            VerCode.enabled = YES;
        } else {
            VerCode.backgroundColor = key_BgColorB2;
            VerCode.enabled = NO;
        }
        
        if (passwordNum.text.length > 0 && aString.length > 0) {
            logionBtn.backgroundColor = key_BgColorF6E;
            logionBtn.enabled = YES;
        } else {
            logionBtn.enabled = NO;
            logionBtn.backgroundColor = key_BgColorB2;
        }

    }
    
    if(passwordNum == textField)
    {
        if ([aString length] > 6) {
            textField.text = [aString substringToIndex:6];
            return NO;
        }
        if (phoneNum.text.length > 0 && aString.length > 0) {
            logionBtn.backgroundColor = key_BgColorF6E;
            logionBtn.enabled = YES;
        } else {
            logionBtn.enabled = NO;
            logionBtn.backgroundColor = key_BgColorB2;
        }
    }
    return YES;
}



@end
