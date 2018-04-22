//
//  ViewController.m
//  RAC_Timer
//
//  Created by JM on 2018/4/21.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** timer */
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD设置timer
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, <#dispatch_queue_t  _Nullable queue#>)

}

- (void)demo {
    //    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerDown) userInfo:nil repeats:YES];
    
    //创建子线程
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        //开启RunLoop循环
        [[NSRunLoop currentRunLoop] run];
    }];
    
    //启动线程
    [thread start];
}

- (void)timerDown {
    static int i = 0;
    i++;
    NSLog(@"%d", i);
}

@end
