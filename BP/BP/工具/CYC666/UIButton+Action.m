//
//  UIButton+Action.m
//  BaseProject
//
//  Created by 曹老师 on 2018/8/21.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>
static const void *ButtonBlockKey = &ButtonBlockKey;

@implementation UIButton (Action)

- (void)addAction:(CButtonBlock)buttonBlock {
    
    // 将block与self绑定，绑定关系为ButtonBlockKey
    objc_setAssociatedObject(self, ButtonBlockKey, buttonBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)buttonAction:(UIButton *)button {
    
    // 从绑定关系中获取block
    CButtonBlock block = objc_getAssociatedObject(self, ButtonBlockKey);
    if (block) {
        block(button.tag);
    }
    
}

@end
