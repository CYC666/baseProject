//
//  UILabel+Action.h
//  BaseProject
//
//  Created by 曹老师 on 2018/8/23.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^UILabelBlock)(void);

@interface UILabel (Action)

- (void)addAction:(UILabelBlock)labelBlock;


@end
