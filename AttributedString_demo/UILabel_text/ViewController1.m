//
//  ViewController1.m
//  UILabel_text
//
//  Created by KH on 16/6/22.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController1.h"
#import "NSAttributedString+PDCAdd.h"


@interface ViewController1()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@end

@implementation ViewController1

-(void )viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableAttributedString *attr1 = [[NSMutableAttributedString alloc] initWithString:@"根据font变化的字体"];
    attr1.font = [UIFont systemFontOfSize:20.0];
    
    NSMutableAttributedString *attr2 = [[NSMutableAttributedString alloc] initWithString:@"带颜色的字体"];
    attr2.color = [UIColor redColor];
    
    NSMutableAttributedString *attr3 = [[NSMutableAttributedString alloc] initWithString:@"带背景颜色的字体"];
    attr3.backgroundColor = [UIColor purpleColor];
    
    NSMutableAttributedString *attr4 = [[NSMutableAttributedString alloc] initWithString:@"带下划线的字体"];
    attr4.link = @"";
    attr4.underlineColor = [UIColor purpleColor];
    attr4.underlineStyle = NSUnderlineStyleSingle;
    
    NSMutableAttributedString *attr5 = [[NSMutableAttributedString alloc] initWithString:@"可调整间距的连体字体"];
    attr5.ligature = @(4.0);
    attr5.kern = @(10.0);
    
    NSMutableAttributedString *attr6 = [[NSMutableAttributedString alloc] initWithString:@"字体笔画宽度变化的字体"];
    attr6.strokeWidth = @(1.0);
    attr6.color = [UIColor purpleColor];
    
    NSMutableAttributedString *attr7 = [[NSMutableAttributedString alloc] initWithString:@"偏移中间变大的字体"];
    attr7.baselineOffset = @(-3.0);
    attr7.expansion = @(0.5);
    
    NSMutableAttributedString *attr8 = [[NSMutableAttributedString alloc] initWithString:@"带删除线的斜体字"];
    attr8.obliqueness = @(0.5);
    attr8.strikethroughStyle = NSUnderlineStyleSingle;
    
    NSMutableAttributedString *attr9 = [[NSMutableAttributedString alloc] initWithString:@"带阴影的字体，很好看"];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(2.0, 2.0);
    shadow.shadowBlurRadius = 3.0;
    shadow.shadowColor = [UIColor blueColor];
    attr9.shadow = shadow;
    
    NSMutableAttributedString *attr10 = [[NSMutableAttributedString alloc] initWithString:@"不知什么鬼的字体"];
    attr10.verticalGlyph = @(0);
    
    self.label1.attributedText = [attr1 copy];
    self.label2.attributedText = [attr2 copy];
    self.label3.attributedText = [attr3 copy];
    self.label4.attributedText = [attr4 copy];
    self.label5.attributedText = [attr5 copy];
    self.label6.attributedText = [attr6 copy];
    self.label7.attributedText = [attr7 copy];
    self.label8.attributedText = [attr8 copy];
    self.label9.attributedText = [attr9 copy];
    self.label10.attributedText = [attr10 copy];
}

@end
