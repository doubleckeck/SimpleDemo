//
//  MyObj1.m
//  弱引用
//
//  Created by KH on 16/7/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "MyObj1.h"

@implementation MyObj1
-(void )action:(id )sender
{
    NSLog(@"跳转到了MyObj 1 1 1 1 1 1，class : %@",sender);
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"MyObj1 ----------------3");
    [super doesNotRecognizeSelector:aSelector];
    
    
}
@end
