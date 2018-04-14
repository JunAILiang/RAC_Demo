//
//  Dog.m
//  RAC_Block
//
//  Created by JM on 2018/4/14.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void (^)(int))run {
    return ^(int m){
        NSLog(@"开始运行第%zd次", m);
    };
}

- (void)sleep:(void (^)(NSString *))block {
    block(@"睡觉");
}

@end
