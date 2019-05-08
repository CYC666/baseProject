//
//  UITextField+Action.m
//  BaseProject
//
//  Created by 曹老师 on 2018/9/13.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import "UITextField+Action.h"


#import <objc/runtime.h>
static const void *UITextFieldBlockKey = &UITextFieldBlockKey;

@implementation UITextField (Action)

- (void)addReturnAction:(UITextFieldBlock)fieldBlock {
    
    // 将block与self绑定，绑定关系为ButtonBlockKey
    objc_setAssociatedObject(self, UITextFieldBlockKey, fieldBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(fieldAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
}


- (void)fieldAction:(UITextField *)field {
    
    // 从绑定关系中获取block
    UITextFieldBlock block = objc_getAssociatedObject(self, UITextFieldBlockKey);
    if (block) {
        block();
    }
    
    
    
}




@end
