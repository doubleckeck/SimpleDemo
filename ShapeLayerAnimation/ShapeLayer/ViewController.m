//
//  ViewController.m
//  ShapeLayer
//
//  Created by KH on 16/6/20.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (strong, nonatomic) CAShapeLayer *layer_my;
@property (strong, nonatomic) CAShapeLayer *layer_my1;

@property (strong, nonatomic) UIBezierPath *smallTrianglePath;
@property (strong, nonatomic) UIBezierPath *leftTrianglePath;

@property (assign, nonatomic) CGFloat vaule;
@end

@implementation ViewController
{
    NSInteger count;
}
-(CAShapeLayer *)layer_my
{
    if (_layer_my == nil) {
        _layer_my = [CAShapeLayer new];
        _layer_my.frame = CGRectMake(100, 100, 100, 100);
//        _layer_my.backgroundColor = [UIColor purpleColor].CGColor;
        _layer_my.fillColor = [UIColor whiteColor].CGColor;
        _layer_my.strokeColor = [UIColor purpleColor].CGColor;
        _layer_my.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)].CGPath;
    }
    return _layer_my;
}

-(CAShapeLayer *)layer_my1
{
    if (_layer_my1 == nil) {
        _layer_my1 = [CAShapeLayer new];
        _layer_my1.frame = CGRectMake(100, 300, 100, 100);
        _layer_my1.fillColor = [UIColor whiteColor].CGColor;
        _layer_my1.strokeColor = [UIColor purpleColor].CGColor;
        _layer_my1.lineWidth = 10.0;

        UIBezierPath *bpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI*2*self.vaule clockwise:YES];
        [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(changePath:) userInfo:nil repeats:YES];

        
        _layer_my1.path = bpath.CGPath;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.toValue = @(M_PI * 2);
        animation.duration = 1.618;
        animation.repeatCount = 1000;
        [_layer_my1 addAnimation:animation forKey:nil];
        
    }
    return _layer_my1;
}

-(void )changePath:(NSTimer *)timer
{
    count++;
    self.vaule = count % 50 / 48.0;
    UIBezierPath *bpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI*2*self.vaule clockwise:YES];
    _layer_my1.path = bpath.CGPath;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void )viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view.layer addSublayer:self.layer_my];
    
    [self.view.layer addSublayer:self.layer_my1];
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)].CGPath;
    animation.duration = 3.618;
    animation.repeatCount = MAXFLOAT;
    [self.layer_my addAnimation:animation forKey:nil];
}


@end
