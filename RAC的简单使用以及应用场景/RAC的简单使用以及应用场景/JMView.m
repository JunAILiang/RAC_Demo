//
//  JMView.m
//  RAC的简单使用以及应用场景
//
//  Created by JM on 2018/4/20.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "JMView.h"

@interface JMView()

@end

@implementation JMView

- (RACSubject *)btnClickSignal {
    if (!_btnClickSignal) {
        _btnClickSignal = [RACSubject subject];
    }
    return _btnClickSignal;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 10, 100, 60);
        [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

#pragma mark - 按钮点击事件
- (void)btnClick {
    [self.btnClickSignal sendNext:@"随便传个啥都行啦"];
}

@end
