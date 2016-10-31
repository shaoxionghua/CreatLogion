//
//  RemarkViewController.m
//  快速集成注册登录页面
//
//  Created by danggui on 2016/10/31.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import "RemarkViewController.h"
#import "General.h" 

@interface RemarkViewController ()

@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [MyLib colorWithHexString:ViewBgColor];
    
    if (self.type ==0) {
        NSLog(@"1");
        self.title = @"服务条款";
//        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"service_policy" ofType:@"html"];
//        NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//        [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
        NSString *urlstr = @"http://www.baidu.com";
        [self loadWebPageWithString:urlstr];
        
    }
    else if (self.type ==1)
    {
        NSLog(@"2");
        self.title = @"隐私条款";
//        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"privacy_policy" ofType:@"html"];
//        NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//        [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
        NSString *urlstr = @"http://www.baidu.com";
        [self loadWebPageWithString:urlstr];
    }
    
    if (iPhone4s) {
        CGRect rect = self.webView.frame;
        rect.size.height -= 88;
        self.webView.frame = rect;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)doBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


- (void)loadWebPageWithString:(NSString*)urlString
{
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 ));
    NSURL *url =[NSURL URLWithString:encodedString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


@end
