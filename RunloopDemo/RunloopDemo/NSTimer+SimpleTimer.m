//
//  NSTimer+SafetyTimer.m
//  RunloopDemo
//
//  Created by KH on 16/6/15.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "NSTimer+SimpleTimer.h"
static dispatch_source_t timer;

@implementation NSTimer (SimpleTimer)
+(void )run_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action
{
    __block BOOL stop = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        NSValue *value = [NSValue valueWithPointer:&stop];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:value forKey:@"stop"];
        [dict setObject:action forKey:@"action"];
        [runloop addTimer:[NSTimer timerWithTimeInterval:interval target:self selector:@selector(runloopTimer:) userInfo:dict repeats:repeat] forMode:NSDefaultRunLoopMode];
        [runloop run];
    });
}

+(void )runloopTimer:(NSTimer *)sender
{
    NSDictionary *dict = sender.userInfo;
    NSValue *value = dict[@"stop"];
    BOOL *stop = [value pointerValue];
    void (^action)(BOOL *) = dict[@"action"];
    if (action&&(!*stop))
    {
        action(stop);
    }
    else
    {
        [sender invalidate];
        sender = nil;
        [[NSThread currentThread] cancel];
    }
}

/* 这个只能创建一个timer */
+(void )gcd_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action
{
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    [NSTimer gcd_scheduledTimerWithSource:timer timerInterval:interval repeat:repeat action:action end:^(dispatch_source_t timer) {
        timer = NULL;
    }];
}

+(void )gcd_scheduledTimerWithSource:(dispatch_source_t )source timerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action end:(void (^)(dispatch_source_t source)) end
{
    __block BOOL stop = NO;
    dispatch_source_set_timer(source, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(source, ^{
        if (stop^repeat&&action)
        {
            action(&stop);
        }
        else
        {
            dispatch_source_set_cancel_handler(source, ^{
                if (end)
                {
                    end(source);
                }
            });
        }
    });
    dispatch_resume(source);
}
@end
