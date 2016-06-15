//
//  NSTimer+SafetyTimer.h
//  RunloopDemo
//
//  Created by KH on 16/6/15.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SafetyTimer)
+(void )run_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action;

+(void )gcd_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action;

+(void )gcd_scheduledTimerWithSource:(dispatch_source_t )source timerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action end:(void (^)(dispatch_source_t source)) end;
@end
