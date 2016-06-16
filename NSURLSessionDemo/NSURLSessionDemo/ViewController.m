//
//  ViewController.m
//  NSURLSessionDemo
//
//  Created by KH on 16/6/16.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.hao123.com/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@",error.userInfo);
        }
        else
        {
            NSLog(@"%@",response);
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
            
            [self.webView loadHTMLString:str baseURL:[NSURL new]];
        }
    }];
    
    [task resume];
    
//    if (task)
//    {
//        NSLog(@"%@",task);
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
