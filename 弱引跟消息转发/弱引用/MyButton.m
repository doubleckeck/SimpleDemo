//
//  MyButton.m
//  弱引用
//
//  Created by KH on 16/7/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void )setController:(UIViewController *)controller
{
    _controller = controller;
    
    [self addTarget:controller action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}


@end
