//
//  ViewController.m
//  UILabel_text
//
//  Created by KH on 16/6/22.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+PDCAdd.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label.attributedText = [NSAttributedString linkString:@"这是一个带下划线的label"];
    
    [self.btn setAttributedTitle:[NSAttributedString linkString:@"这是一个带下划线的button" range:NSMakeRange(2,7)] forState:UIControlStateNormal];
}
@end
