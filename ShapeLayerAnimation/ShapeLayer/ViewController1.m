//
//  ViewController1.m
//  ShapeLayer
//
//  Created by KH on 16/6/20.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController1.h"
@interface ViewController1()
@property (strong, nonatomic) CAShapeLayer *my_layer;

@property (assign, nonatomic) CGFloat value;
@end
@implementation ViewController1

-(void )viewDidLoad
{
    [super viewDidLoad];
    
    self.my_layer = [[CAShapeLayer alloc] init];
    self.my_layer.frame = CGRectMake(100, 100, 200, 200);
    
    self.my_layer.fillColor = [UIColor whiteColor].CGColor;
    self.my_layer.strokeColor = [UIColor purpleColor].CGColor;
    
    self.my_layer.lineWidth = 3.0;
    
    self.my_layer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI*2.0*self.value clockwise:YES].CGPath;
    
    [self.view.layer addSublayer:self.my_layer];
    
    
}

- (IBAction)slider:(UISlider *)sender
{
    self.value = sender.value;
    self.my_layer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI*2.0*self.value clockwise:YES].CGPath;
}

@end
