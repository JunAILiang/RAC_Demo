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

/** subscriber */
@property (nonatomic, strong) id <RACSubscriber>subscriber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    //2.订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收数据X: %@",x);
    }];
    
    //3.发送数据
    [subject sendNext:@"JM"];
    
}

- (void)demo {
    //1.创建信号(冷信号)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        //3.发送信号
        [subscriber sendNext:@"我在发送信号"];
        self.subscriber = subscriber;
        
        return [RACDisposable disposableWithBlock:^{
            //只要信号取消订阅就会进入这个block
            NSLog(@"取消订阅了");
        }];
    }];
    
    //2.订阅信号(热信号)
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅信号 %@", x);
    }];
    
    //因为有订阅者在, 所有手动取消订阅
    [disposable dispose];
}


@end
