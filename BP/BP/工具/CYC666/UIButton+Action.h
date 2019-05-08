//
//  UIButton+Action.h
//  BaseProject
//
//  Created by 曹老师 on 2018/8/21.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CButtonBlock)(NSInteger index);

@interface UIButton (Action)

- (void)addAction:(CButtonBlock)buttonBlock;

@end
