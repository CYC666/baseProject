//
//  UIImageView+Action.m
//  BaseProject
//
//  Created by 曹老师 on 2018/8/21.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import "UIImageView+Action.h"
#import <objc/runtime.h>
static const void *UIImageViewBlockKey = &UIImageViewBlockKey;

@implementation UIImageView (Action)

- (void)addAction:(UIImageViewBlock)imageViewBlock {
    
    // 将block与self绑定
    objc_setAssociatedObject(self, UIImageViewBlockKey, imageViewBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewAction:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    
}


- (void)imageViewAction:(UITapGestureRecognizer *)tap {
    
    // 从绑定关系中获取block
    UIImageViewBlock block = objc_getAssociatedObject(self, UIImageViewBlockKey);
    if (block) {
        block();
    }
    
}

@end
