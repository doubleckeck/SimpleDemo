//
//  ViewController.m
//  RunloopDemo
//
//  Created by KH on 16/6/14.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "RunloopDemo0.h"
@interface RunloopDemo0 ()
@property (strong, nonatomic) NSThread *thread;

@end

@implementation RunloopDemo0

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    while (1)
//    {
//        NSLog(@"while begin");
//        // the thread be blocked here
//        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//        [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//        // this will not be executed
//        NSLog(@"while end");
//        
//    }
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        while (1)
//        {
//            NSLog(@"循环开始");
//            NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//            [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];   //休眠
//            NSLog(@"循环结束");
//        }
//        
//        
//    });
    
    
    /* tap1 */
//    [self tryPerformSelectorOnMianThread];
    
    /* tap2 */
//    [self tryPerformSelectorOnBackGroundThread];
    
    /* tap3 */
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(startThread:) object:nil];
    
    [self.thread start];
}

//---------------- 点击屏幕调用方法 -------------- tap3
-(void )startThread:(id )sender
{
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}

-(void )touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self performSelector:@selector(doBackGroundThreadWork) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)doBackGroundThreadWork
{
    NSLog(@"调用了方法 %s",__FUNCTION__);
}


//--------------    main thread 已经存在runloop --------- tap1
- (void)tryPerformSelectorOnMianThread
{
    
    [self performSelector:@selector(mainThreadMethod) withObject:nil];
}

- (void)mainThreadMethod
{
    
    NSLog(@"self 方法 %s",__func__);
}


//------------ 自己创建的线程需要手动添加source ---------------- tap2
- (void)tryPerformSelectorOnBackGroundThread
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self performSelector:@selector(backGroundThread) onThread:[NSThread currentThread] withObject:nil waitUntilDone:NO];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop run];
    });
}
- (void)backGroundThread
{
    
    NSLog(@"%u",[NSThread isMainThread]);
    
    NSLog(@"self 方法 %s",__FUNCTION__);
    
}

@end
