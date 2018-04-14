//
//  Dog.h
//  RAC_Block
//
//  Created by JM on 2018/4/14.
//  Copyright © 2018年 JM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

/** block作为返回值 */
- (void(^)(int))run;

/** 声明带参数的block */
- (void)sleep:(void(^)(NSString *))block;

/** block属性 */
@property (nonatomic, strong) void (^block)();

@end
