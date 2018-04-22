//
//  ViewController.m
//  RAC常见用法
//
//  Created by JM on 2018/4/21.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "ViewController.h"
#import "JMView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>

//#import <NSObject+RACKVOWrapper.h>

@interface ViewController ()

/** jmView */
@property (nonatomic, strong) JMView *jmView;

/** btn */
@property (nonatomic, strong) UIButton *btn;

/** tf */
@property (nonatomic, strong) UITextField *tf;

@end

@implementation ViewController

- (JMView *)jmView {
    if (!_jmView) {
        _jmView = [[JMView alloc] initWithFrame:CGRectMake(10, 100, 300, 100)];
        _jmView.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:_jmView];
    }
    return _jmView;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor orangeColor];
        [_btn setTitle:@"我是按钮" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.frame = CGRectMake(50, 100, 100, 50);
        [self.view addSubview:_btn];
    }
    return _btn;
}

- (UITextField *)tf {
    if (!_tf) {
        _tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
        _tf.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:_tf];
    }
    return _tf;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //RAC实时监听输入框的值
    [self.tf.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.jmView.frame = CGRectMake(10, 100, 310, 120);
}

- (void)demo3 {
    
    //原生OC监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeEvent) name:@"evnet" object:nil];
    //RAC监听通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"event" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

- (void)demo2 {
    //监听事件(OC原生写法)
    //    [self.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    //监听事件(RAC写法)
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"按钮被点击了---%@", x);
    }];
}


- (void)demo1 {
    
    //RACKVO监听自定义view的frame方式1
    [[self.jmView rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    //    //RACKVO监听自定义view的frame方式2
    //    self.jmView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionOld || [NSKeyValueChangeNewKey observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
    //        NSLog(@"%@---%@",value, change);
    //    }];
}

- (void)demo {
    

    [[self.jmView rac_signalForSelector:@selector(lailma:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"按钮被点击了----%@", x);
    }];

}



@end
