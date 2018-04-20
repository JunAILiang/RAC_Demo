//
//  JMView.h
//  RAC的简单使用以及应用场景
//
//  Created by JM on 2018/4/20.
//  Copyright © 2018年 JM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>


@interface JMView : UIView

/** 按钮点击信号属性 */
@property (nonatomic, strong) RACSubject *btnClickSignal;

@end
