//
//  RunloopDemo1.m
//  RunloopDemo
//
//  Created by KH on 16/6/14.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "RunloopDemo1.h"
@interface RunloopDemo1()
@property (strong, nonatomic) dispatch_queue_t queue1;
@property (strong, nonatomic) dispatch_queue_t queue2;
@property (strong, nonatomic) NSThread *thread_my;
@end

@implementation RunloopDemo1
{
    BOOL finish;
    NSInteger t;
}

-(void )viewDidLoad
{
    [super viewDidLoad];
    finish = NO;
    
    self.queue1 = dispatch_queue_create("pdc.queue.q1", DISPATCH_QUEUE_CONCURRENT);
    self.queue2 = dispatch_queue_create("pdc.queue.q2", DISPATCH_QUEUE_CONCURRENT);
    
    /* 线程依赖 线程2执行任务依赖于线程1 */

    //线程1
    dispatch_async(self.queue1, ^{
        

        NSLog(@"开始");
        [self performSelector:@selector(threadMothod:) onThread:[NSThread currentThread] withObject:nil waitUntilDone:NO];
        //必须添加到runloop
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"queue2");
    });
    
    //线程2
    dispatch_async(self.queue2, ^{
        
        self.thread_my = [NSThread currentThread];
        
        NSLog(@"开始runloop");
        
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        
        do{
            //休眠
            NSLog(@" ------ 第%@ 次休眠\n\n",@(t));
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            NSLog(@"执行任务......%@",@(t));
        }while (!finish);
        
        NSLog(@"线程结束\n\n");
    });
    
    
}

-(void )threadMothod:(id )sender
{
    for (NSInteger i = 0; i < 5; i ++)
    {
        NSLog(@"第一个线程的循环中, count = %ld", i);
        sleep(1);
    }

    //唤醒 thread_my
    
    [self performSelector:@selector(tryOnMyThread) onThread:self.thread_my withObject:nil waitUntilDone:NO];
    
    for (NSUInteger i = 0; i < 10; i++)
    {
        sleep(1);
        [self performSelector:@selector(tryOnMyThread) onThread:self.thread_my withObject:nil waitUntilDone:NO];
    }
    
    finish = YES;   //什么时候完成
    [self.thread_my cancel];
    self.thread_my = nil;
}

-(void )tryOnMyThread
{
    t++;
    NSLog(@"唤醒 ++++++ %@ 次",@(t));
}

@end
