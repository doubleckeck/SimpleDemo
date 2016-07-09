//
//  MyObj.m
//  弱引用
//
//  Created by KH on 16/7/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "MyObj.h"

@implementation MyObj
//-(void )action:(id )sender
//{
//    NSLog(@"跳转到了MyObj，class : %@",sender);
//}


-(void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"MyObj 2");
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"MyObj ----------------3");
    [super doesNotRecognizeSelector:aSelector];
    
    
}
@end
