//
//  ViewController.m
//  RAC集合类
//
//  Created by JM on 2018/4/21.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //声明字典
    NSDictionary *dict = @{
                           @"name":@"JM",
                           @"age":@"18"
                           };
    
    //字典转集合
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        NSLog(@"%@",x);
        
        //RACTupleUnpack宏用来解析元祖
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"key---%@, value---%@",key, value);
    }];
    

}

- (void)demo2 {
    //原生OC数组
    NSArray *arr = @[@"111",@"222",@666];
    //遍历
    [arr.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}

- (void)demo1 {
    //原生OC数组
    NSArray *arr = @[@"111",@"222",@666];
    
    //转换为RAC集合
    RACSequence *requence = arr.rac_sequence;
    //遍历(返回值是信号)
    RACSignal *signal = requence.signal;
    //订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

- (void)demo {
    //元祖
    RACTuple *tuple = [RACTuple tupleWithObjectsFromArray:@[@"111",@"222",@"333"]];
    NSString *str = tuple[0];
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
