//
//  UITextField+Action.h
//  BaseProject
//
//  Created by 曹老师 on 2018/9/13.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UITextFieldBlock)(void);

@interface UITextField (Action)

- (void)addReturnAction:(UITextFieldBlock)fieldBlock;

@end
