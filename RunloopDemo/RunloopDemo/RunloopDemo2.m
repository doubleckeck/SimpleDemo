//
//  RunloopDemo2.m
//  RunloopDemo
//
//  Created by KH on 16/6/15.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "RunloopDemo2.h"
#import "NSTimer+SimpleTimer.h"

@interface RunloopDemo2()

@end

@implementation RunloopDemo2
{
    /* simple1 */
    NSTimer *_timer;
    NSUInteger _count;
    BOOL _finish;
    NSRunLoop *runloop;
    
    /* simple2 */
    dispatch_source_t gcd_timer;
    
    /* simple3 */
    NSTimer *my_timer;
}

-(void )viewDidLoad
{
    [super viewDidLoad];
    
//    [self pr_simple1];
    
//    [self pr_simple2];
    
     [self pr_simple3];
}

#pragma mark - simple1  runloop timer
-(void )pr_simple1
{
    //这个方法创建的timer默认添加到主线程的runloop，所以这里可能会有偏差，当主线程卡死的时候timer不会调用
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    //用这个方法创建的timer，未添加到runloop中，所以不会执行，需要手动添加到runloop中
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:@"user info" repeats:YES];
    //将timer添加到子线程的runloop中
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        runloop = [NSRunLoop currentRunLoop];
        
        //将timer添加到当前线程的runloop中
//        [runloop addTimer:_timer forMode:NSDefaultRunLoopMode];
        
        [self performSelector:@selector(pr_prepare) onThread:[NSThread currentThread] withObject:nil waitUntilDone:NO];
        
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
    NSLog(@"%@",sender);
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

#pragma mark - simple2  gcd timer 1
-(void )pr_simple2
{
    NSLog(@"开始");
    //这里必须强引用，不然执行的时候被释放了，block不会调用
    gcd_timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(gcd_timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(gcd_timer, ^{
        NSLog(@"gcd timer 执行");
    });
    dispatch_resume(gcd_timer);
}

#pragma mark - simple3 timer
-(void )pr_simple3
{
    NSLog(@"开始");
    __block NSInteger t = 0;
    /* 第一种定时器 */
//    [NSTimer run_scheduledTimerWithTimerInterval:1 repeat:YES action:^(BOOL *stop) {
//        t++;
//        NSLog(@"执行第%@次",@(t));
//        if (t == 10)
//        {
//            *stop = YES;
//        }
//    }];
    
    /* 第二种定时器 */
    dispatch_source_t ti = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    [NSTimer gcd_scheduledTimerWithSource:ti timerInterval:1 repeat:YES action:^(BOOL *stop) {
        t++;
        NSLog(@"1----执行第%@次",@(t));
        if (t == 10)
        {
            *stop = YES;
        }
    } end:^(dispatch_source_t source) {
        source = NULL;
    }];
    
    /* 第三种定时器，这个只能创建一个定时器，以最后创建的为准 */
//    [NSTimer gcd_scheduledTimerWithTimerInterval:1 repeat:YES action:^(BOOL *stop) {
//        t++;
//        NSLog(@"1----执行第%@次",@(t));
//        if (t == 10)
//        {
//            *stop = YES;
//        }
//    }];
}
@end
