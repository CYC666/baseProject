//
//  CYC666.m
//  BaseProject
//
//  Created by 曹老师 on 2018/8/13.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import "CYC666.h"
#import "UITextField+Action.h"
#import <objc/runtime.h>

@interface CYC666 ()

@end

@implementation CYC666

#pragma mark ========================================字符串=============================================
#pragma mark - 判断日期字符串str1是否比str2大 （yyyy-MM-dd）0相等 1大于 2小于 3其他错误
+ (NSInteger)checkBigDate:(NSString *)str1 smallDate:(NSString *)str2 {
    
    NSArray *startList = [str1 componentsSeparatedByString:@"-"];
    NSArray *endList = [str2 componentsSeparatedByString:@"-"];
    
    if (startList.count < 3 || endList.count < 3) {
        return 3;
    }
    
    NSInteger startValue = [startList[0] integerValue] * 360 + [startList[1] integerValue] * 30 + [startList[2] integerValue];
    NSInteger endValue = [endList[0] integerValue] * 360 + [endList[1] integerValue] * 30 + [endList[2] integerValue];
    
    if (startValue > endValue) {
        return 1;
    } else if (startValue == endValue) {
        return 0;
    } else {
        return 2;
    }
    
    
}

#pragma mark - 判断时间字符串str1是否比str2大 （hh:mm:ss）0相等 1大于 2小于 3其他错误
+ (NSInteger)checkBigTime:(NSString *)str1 smallTime:(NSString *)str2 {
    
    NSArray *startList = [str1 componentsSeparatedByString:@":"];
    NSArray *endList = [str2 componentsSeparatedByString:@":"];
    
    if (startList.count < 3 || endList.count < 3) {
        return 3;
    }
    
    NSInteger startValue = [startList[0] integerValue] * 360 + [startList[1] integerValue] * 30 + [startList[2] integerValue];
    NSInteger endValue = [endList[0] integerValue] * 360 + [endList[1] integerValue] * 30 + [endList[2] integerValue];
    
    if (startValue > endValue) {
        return 1;
    } else if (startValue == endValue) {
        return 0;
    } else {
        return 2;
    }
    
    
}

#pragma mark - 判断日期时间字符串str1是否比str2大 （yyyy-MM-dd hh:mm:ss）0相等 1大于 2小于 3其他错误
+ (NSInteger)checkBigDateTime:(NSString *)str1 smallDateTime:(NSString *)str2 {
    
    NSArray *list1 = [str1 componentsSeparatedByString:@" "];
    NSArray *list2 = [str2 componentsSeparatedByString:@" "];
    
    if (list1.count < 2 || list2.count < 2) {
        return 3;
    }
    
    if ([self checkBigDate:list1.firstObject smallDate:list2.firstObject] == 1) {
        return 1;
    } else if ([self checkBigDate:list1.firstObject smallDate:list2.firstObject] == 0) {
        
        if ([self checkBigTime:list1.lastObject smallTime:list2.lastObject] == 1) {
            return 1;
        } else if ([self checkBigTime:list1.lastObject smallTime:list2.lastObject] == 0) {
            return 0;
        } else {
            return 2;
        }
        
    } else {
        return 2;
    }
}

#pragma mark - 获取两个日期的天数差  (日期格式yyyy-MM-dd)
+ (NSInteger)getDistanceByDay1:(NSString *)day1 day2:(NSString *)day2 {
    
    // 将入住日转为时间戳
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    formatter1.dateFormat = @"yyyy-MM-dd";
    NSDate *date1 = [formatter1 dateFromString:day1];
    NSInteger timeSp1 = [[NSNumber numberWithDouble:[date1 timeIntervalSince1970]] integerValue];
    
    // 将离开日转为时间戳
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    formatter2.dateFormat = @"yyyy-MM-dd";
    NSDate *date2 = [formatter2 dateFromString:day2];
    NSInteger timeSp2 = [[NSNumber numberWithDouble:[date2 timeIntervalSince1970]] integerValue];
    
    NSInteger dayCount = (timeSp2 - timeSp1) / (24 * 60 * 60);
    
    return dayCount;
    
}

#pragma mark - 判断字符串是否是空的
+ (BOOL)isEmptyString:(NSString *)text {
    return [text isKindOfClass:[NSNull class]] || text == nil || [text length] < 1 ? YES : NO ;
}

#pragma mark - 创建一个富文本字符串
+ (NSMutableAttributedString *)loadMutableStringWithString:(NSString *)text
                                               lineSpacing:(CGFloat)lineSpacing
                                          paragraphSpacing:(CGFloat)paragraphSpacing {
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragrah = [[NSMutableParagraphStyle alloc] init];
    paragrah.lineSpacing = lineSpacing;             // 行间距
    paragrah.paragraphSpacing = paragraphSpacing;   // 段落间距
    NSRange range = NSMakeRange(0, string.length);
    [string addAttribute:NSParagraphStyleAttributeName value:paragrah range:range];
    
    return string;
    
}

#pragma mark - 创建一个图文混排的富文本
+ (NSMutableAttributedString *)loadMutableStringWithString:(NSString *)text
                                                 imageName:(NSString *)name
                                                    bounds:(CGRect)bounds
                                                     index:(NSInteger)index {
    
    // 图文混排
    NSTextAttachment * attach= [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:name];
    attach.bounds = bounds;
    NSAttributedString *att = [NSAttributedString attributedStringWithAttachment:attach];
    NSMutableAttributedString *mutableAtt  = [[NSMutableAttributedString alloc] initWithString:text];
    [mutableAtt insertAttributedString:att atIndex:index];
    
    
    return mutableAtt;
    
}

#pragma mark - 计算文本的大小
+ (CGSize)loadSizeWithString:(NSString *)text
                       width:(CGFloat)width
                    fontSize:(CGFloat)fontSize
                   attribute:(NSMutableAttributedString *)attribute {
    
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName : attribute};
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:dic
                                     context:nil].size;
    return size;
    
}


#pragma mark - 手机号加密显示
+ (NSString *)lockMobileNumber:(NSString *)mobileNumber{
    
    if (mobileNumber == nil || [mobileNumber isEqualToString:@""]) {
        return @"***";
    } else {
        NSString *firstStr = [mobileNumber substringToIndex:3];
        NSString *secondStr = [mobileNumber substringFromIndex:[mobileNumber length]-4];
        NSString *result = [NSString stringWithFormat:@"%@****%@",firstStr,secondStr];
        
        return result;
    }
}


#pragma mark - 验证手机号码
+ (BOOL)validateMobile:(NSString *)mobile {
    if (mobile.length == 0) {
        
        return NO;
    }
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    if (![phoneTest evaluateWithObject:mobile]) {
        
        return NO;
    }
    return YES;
}

#pragma mark - 验证电子邮箱
+ (BOOL)validateEmail:(NSString *)email {
    if (email.length == 0) {
        
        return NO;
    }
    
    NSString *expression = [NSString stringWithFormat:@"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"];
    NSError *error = NULL;
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:expression
                                                                      options:NSRegularExpressionCaseInsensitive
                                                                        error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:email options:0 range:NSMakeRange(0, [email length])];
    if (!match) {
        return NO;
    }
    return YES;
}

#pragma mark - 验证密码
+ (BOOL)validatePassword:(NSString *)password {
    if (password.length == 0) {
       
        return NO;
    }
    NSRange _range = [password rangeOfString:@" "];
    if (_range.location != NSNotFound) {
       
        return NO;
    }
    if (password.length < 6) {
        return NO;
    }

    return YES;
}

#pragma mark ========================================按钮=============================================

#pragma mark - 创建一个按钮，不需要设置的值传nil即可
+ (UIButton *)creatButton:(UIView *)superView
                    Frame:(CGRect)frame
                    Image:(NSString *)image
                    Title:(NSString *)title
               TitleColor:(UIColor *)titleColor
          BackgroundColor:(UIColor *)bgColor {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (image) {
        [button setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (bgColor) {
        button.backgroundColor = bgColor;
    }
    
    [superView addSubview:button];
    return button;
}



#pragma mark ========================================输入框=============================================

#pragma mark - 设置几个输入框，点击return，下个输入框自动变成第一响应者
+ (void)setTextFieldsActive:(NSArray<UITextField *> *)fields {
    
    for (NSInteger i = 0; i < fields.count; i++) {
        
        UITextField *field = fields[i];
        field.returnKeyType = UIReturnKeyNext;
        
        [field addReturnAction:^{
            // 点击了return
            if (i != fields.count-1) {
                
                // 不是最后一个，那么回车跳到下一个
                UITextField *field2 = fields[i+1];
                [field2 becomeFirstResponder];
                
            } else {
                
                // 最后一个，收起键盘
                [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
            }
        }];
        
        
        
    }
    
    
}



#pragma mark ========================================视图=============================================

#pragma mark - 指定圆角
+ (void)cornerRadiusAction:(UIView *)view
                    radius:(CGFloat)radius
         byRoundingCorners:(UIRectCorner)corners {
    
    // 圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
}

#pragma mark - 颜色渐变
+ (void)flowColorWithView:(UIView *)view
                   color1:(UIColor *)color1
                   color2:(UIColor *)color2
               startPoint:(CGPoint)point1
                 endPoint:(CGPoint)point2 {
    
    /**< 初始化渐变层 */
    CAGradientLayer *gradientColorLayer = [CAGradientLayer layer];
    gradientColorLayer.frame = view.bounds;
    [view.layer addSublayer:gradientColorLayer];
    [view.layer insertSublayer:gradientColorLayer atIndex:0];
    
    /**< 设置颜色组 */
    gradientColorLayer.colors = @[(__bridge id)color1.CGColor,
                                  (__bridge id)color2.CGColor];
    
    /**< 设置颜色分割点 */
    gradientColorLayer.locations  = @[@(0.5)];
    
    
    /**< 设置渐变颜色方向 */
    // 1、起始位置
    gradientColorLayer.startPoint = point1;
    // 2、结束位置
    gradientColorLayer.endPoint   = point2;
    
    
}


#pragma mark - 通过颜色生成图片
+ (UIImage *)GetImageWithColor:(UIColor *)color andHeight:(CGFloat)height {
    CGRect r = CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

#pragma mark - 银河社区的阴影
+ (void)setYHShadow:(UIView *)view Radius:(float)radius {
    
    
    view.layer.cornerRadius = radius;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = 10;
    view.layer.shadowOpacity = 0.05;
    view.layer.shadowColor = CRGB(0, 0, 0, 0.8).CGColor;
    
    
}






@end

