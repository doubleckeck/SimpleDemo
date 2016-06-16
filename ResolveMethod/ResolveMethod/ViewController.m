//
//  ViewController.m
//  ResolveMethod
//
//  Created by KH on 16/6/16.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import <objc/runtime.h>
@interface ViewController ()
-(void )show;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self show];
    
//    [ViewController show2];
    
}
//
///* 第一次 */
//+(BOOL )resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"实例方法未找到:%p",sel);
//    return YES;
//}
//
//+(BOOL )resolveClassMethod:(SEL)sel
//{
//    NSLog(@"类方法未找到: %p",sel);
//
//    return YES;
//}

/* 第二次 */
-(id )forwardingTargetForSelector:(SEL)sel
{

    NSLog(@"转发给谁这里 1");
    class_addMethod([self class], sel, imp_implementationWithBlock(^(id _self) {
        NSLog(@"添加处理了");
        NSLog(@"%@",self);
    }), "v@:@");
//    return nil;
    /* 转发给Test */
//    return [[Test alloc] init];
    return self;
}

-(NSMethodSignature * )methodSignatureForSelector:(SEL )aSelector
{
    NSLog(@"转发给谁签名这里 2 ");
    return [[self class] instanceMethodSignatureForSelector:aSelector];
}

/* 最后 */
- (void)forwardInvocation:(NSInvocation *)invocation
{

    NSLog(@"最后这里 3");
    SEL sel = invocation.selector;
    Test *t = [[Test alloc] init];
    if([self respondsToSelector:sel])
    {
        [invocation invokeWithTarget:self];
    }
    else if ([t respondsToSelector:sel])
    {
        [invocation invokeWithTarget:t];
    }
    else
    {
//        [self doesNotRecognizeSelector:sel];
        NSLog(@"异常来了");
    }
}


-(void )setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefined key : %@",key);
}
@end
