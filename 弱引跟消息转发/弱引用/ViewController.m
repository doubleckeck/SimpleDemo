//
//  ViewController.m
//  弱引用
//
//  Created by KH on 16/7/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ViewController.h"
#import "MyButton.h"
#import "MyObj.h"
#import "MyObj1.h"

NSUInteger hashFunc(const void *item,NSUInteger( *size)(const void *item))
{
    NSLog(@"hasf");
    return 10;
}

NSUInteger size(const void *item)
{
    NSLog(@"size");
    return 100;
}

NSUInteger f()
{
    NSLog(@"func");
    return 10;
}

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyButton *btn;
@property () NSUInteger (*func)();



@property (strong, nonatomic) MyObj *obj;
@property (strong, nonatomic) MyObj1 *obj1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn.controller = self;
//    
//    NSPointerFunctions *pointFunc = [[NSPointerFunctions alloc] initWithOptions:NSPointerFunctionsStrongMemory];
//    
//    pointFunc.hashFunction(NULL,size(NULL));
////    NSLog(@"afewfe");
//    
//    self.func = f;
//    
//    self.func();
    
    
    self.obj = [MyObj new];
    self.obj1 = [MyObj1 new];
//    NSObject
}


+(BOOL )resolveInstanceMethod:(SEL)sel
{
    NSLog(@"方法调用,%s",sel);
    BOOL sup = [super resolveInstanceMethod:sel];
    return sup;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"------------methodSignatureForSelector");
    NSMethodSignature *signature = [super
                                    methodSignatureForSelector:aSelector];
    
    if (!signature) {
        signature = [self.obj methodSignatureForSelector:aSelector];
    }
    if (!signature) {
        signature = [self.obj1 methodSignatureForSelector:aSelector];
    }
    return signature;
}


-(id )forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"----------------1");
    if (![self.obj respondsToSelector:aSelector])
    {
        return self.obj;
    }
    return self;
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"2");
    
    [invocation invokeWithTarget:self.obj1];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"----------------3");
    [super doesNotRecognizeSelector:aSelector];
    
    
}



@end
