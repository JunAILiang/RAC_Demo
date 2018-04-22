//
//  JMView.m
//  RAC常见用法
//
//  Created by JM on 2018/4/21.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "JMView.h"

@implementation JMView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"点我" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor orangeColor];
        btn.frame = CGRectMake(10, 10, 100, 50);
        //按钮的点击事件
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)btnClick {
    [self lailma:@"666"];
}

- (void)lailma:(NSString *)str {
    
}

@end
