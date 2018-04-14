//
//  ViewController.m
//  RAC_Block
//
//  Created by JM on 2018/4/14.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    Dog *d = [[Dog alloc] init];
    
    //block作为返回值
    d.run(666);
}

- (void)demo2 {
    //初始化
    Dog *d = [[Dog alloc] init];
    
    //调用方法
    [d sleep:^(NSString * x) {
        NSLog(@"狗狗在%@",x);
    }];
}

- (void)demo1 {
    //初始化
    Dog *d = [[Dog alloc] init];
    
    //调用block属性
    d.block = ^{
        NSLog(@"我被调用了");
    };
}

- (void)demo {
    //声明block
    void(^JMBlock)() = ^() {
        NSLog(@"JMBlock");
    };
    
    //调用block
    JMBlock();
}

@end
