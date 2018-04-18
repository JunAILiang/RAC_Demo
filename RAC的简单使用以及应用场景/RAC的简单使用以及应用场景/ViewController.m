//
//  ViewController.m
//  RAC的简单使用以及应用场景
//
//  Created by JM on 2018/4/19.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建信号(冷信号)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        //3.发送信号
        [subscriber sendNext:@"我在发送信号"];
        
        return nil;
    }];
    
    //2.订阅信号(热信号)
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅信号 %@", x);
    }];
    
    
}


@end
