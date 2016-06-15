//
//  RunloopDemo2.m
//  RunloopDemo
//
//  Created by KH on 16/6/15.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "RunloopDemo2.h"

@interface RunloopDemo2()

@end

@implementation RunloopDemo2
{
    NSTimer *_timer;
    NSUInteger _count;
    BOOL _finish;
    NSRunLoop *runloop;
}

-(void )viewDidLoad
{
    [super viewDidLoad];
    
    [self pr_simple1];
}

#pragma mark - simple1
-(void )pr_simple1
{
    //这个方法创建的timer默认添加到主线程的runloop，所以这里可能会有偏差，当主线程卡死的时候timer不会调用
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    //用这个方法创建的timer，未添加到runloop中，所以不会执行，需要手动添加到runloop中
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    //将timer添加到子线程的runloop中
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        

        
//        [runloop addTimer:_timer forMode:NSDefaultRunLoopMode];
        
        [self performSelector:@selector(pr_prepare) onThread:[NSThread currentThread] withObject:nil waitUntilDone:NO];
        runloop = [NSRunLoop currentRunLoop];
//        [runloop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        
        //指定一个日期让任务到这个日期停止
//        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        //指定一个日期后执行任务
        [runloop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
        
//        [runloop run];  //这个方法调用了下面的代码不会执行
        while (!_finish)
        {
            sleep(1);
            NSLog(@"123");
        }
        
        NSLog(@"完成");
    });
}

-(void )pr_prepare
{
    NSLog(@"等待执行任务中");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((4 + 4) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _finish = YES;
    });
}

-(IBAction)timerAction:(id)sender
{
    if (_count == 10)
    {
        [_timer invalidate];
        _timer = nil;
        _finish = YES;
        NSLog(@"timer finish");
        return;
    }
    NSLog(@"timer call in runloop mode:%@",[NSRunLoop currentRunLoop].currentMode);
    _count++;
}

#pragma mark - simple2

@end
