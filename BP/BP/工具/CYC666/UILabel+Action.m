//
//  UILabel+Action.m
//  BaseProject
//
//  Created by 曹老师 on 2018/8/23.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import "UILabel+Action.h"
#import <objc/runtime.h>
static const void *UILabelBlockKey = &UILabelBlockKey;

@implementation UILabel (Action)

- (void)addAction:(UILabelBlock)labelBlock {
    
    // 将block与self绑定，绑定关系为ButtonBlockKey
    objc_setAssociatedObject(self, UILabelBlockKey, labelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelAction:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    
}


- (void)labelAction:(UITapGestureRecognizer *)tap {
    
    // 从绑定关系中获取block
    UILabelBlock block = objc_getAssociatedObject(self, UILabelBlockKey);
    if (block) {
        block();
    }
    
    
    
}


@end
