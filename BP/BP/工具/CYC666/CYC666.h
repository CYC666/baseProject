//
//  CYC666.h
//  BaseProject
//
//  Created by 曹老师 on 2018/8/13.
//  Copyright © 2018年 众利创投. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 圆角
#define CRadius(View,Radius) [View.layer setCornerRadius:(Radius)]; [View.layer setMasksToBounds:YES];
#define CRadiusBorder(View,Radius,Color,Width) [View.layer setCornerRadius:(Radius)];[View.layer setMasksToBounds:YES];[View.layer setBorderWidth:(Width)];[View.layer setBorderColor:[Color CGColor]];

// 按钮
#define CButtonTitle(Button,Title) [Button setTitle:Title forState:UIControlStateNormal];
#define CButtonColor(Button,Color) [Button setTitleColor:Color forState:UIControlStateNormal];
#define CButtonImage(Button,Name) [Button setImage:CImage(Name) forState:UIControlStateNormal];


typedef void(^CYCNillBlock)(void);

@interface CYC666 : NSObject

//============================================字符串===========================================
// 判断日期字符串str1是否比str2大 （yyyy-MM-dd）0相等 1大于 2小于 3其他错误
+ (NSInteger)checkBigDate:(NSString *)str1 smallDate:(NSString *)str2;

// 判断时间字符串str1是否比str2大 （hh:mm:ss）0相等 1大于 2小于 3其他错误
+ (NSInteger)checkBigTime:(NSString *)str1 smallTime:(NSString *)str2;

// 判断日期时间字符串str1是否比str2大 （yyyy-MM-dd hh:mm:ss）0相等 1大于 2小于 3其他错误
+ (NSInteger)checkBigDateTime:(NSString *)str1 smallDateTime:(NSString *)str2;

// 获取两个日期的天数差  (日期格式yyyy-MM-dd)
+ (NSInteger)getDistanceByDay1:(NSString *)day1 day2:(NSString *)day2;

// 判断字符串是否是空的
+ (BOOL)isEmptyString:(NSString *)text;

// 创建一个富文本字符串
+ (NSMutableAttributedString *)loadMutableStringWithString:(NSString *)text
                                               lineSpacing:(CGFloat)lineSpacing
                                          paragraphSpacing:(CGFloat)paragraphSpacing;

// 创建一个图文混排的富文本
+ (NSMutableAttributedString *)loadMutableStringWithString:(NSString *)text
                                                 imageName:(NSString *)name
                                                    bounds:(CGRect)bounds
                                                     index:(NSInteger)index;

// 计算文本的大小
+ (CGSize)loadSizeWithString:(NSString *)text
                       width:(CGFloat)width
                    fontSize:(CGFloat)fontSize
                   attribute:(NSMutableAttributedString *)attribute;

// 手机号加密显示
+ (NSString *)lockMobileNumber:(NSString *)mobileNumber;

//验证手机号码
+ (BOOL)validateMobile:(NSString *)mobile;

//验证电子邮箱
+ (BOOL)validateEmail:(NSString *)email;

//验证密码
+ (BOOL)validatePassword:(NSString *)password;


//============================================按钮===========================================
// 创建一个按钮
+ (UIButton *)creatButton:(UIView *)superView
                    Frame:(CGRect)frame
                    Image:(NSString *)image
                    Title:(NSString *)title
               TitleColor:(UIColor *)titleColor
          BackgroundColor:(UIColor *)bgColor;

//============================================输入框===========================================

// 设置几个输入框，点击return，下个输入框自动变成第一响应者
+ (void)setTextFieldsActive:(NSArray<UITextField *> *)fields;

//============================================视图===========================================
// 指定圆角
+ (void)cornerRadiusAction:(UIView *)view
                    radius:(CGFloat)radius
         byRoundingCorners:(UIRectCorner)corners;

// 颜色渐变
+ (void)flowColorWithView:(UIView *)view
                   color1:(UIColor *)color1
                   color2:(UIColor *)color2
               startPoint:(CGPoint)point1
                 endPoint:(CGPoint)point2;

// 通过颜色生成图片
+ (UIImage *)GetImageWithColor:(UIColor *)color andHeight:(CGFloat)height;

// 银河社区的阴影
+ (void)setYHShadow:(UIView *)view Radius:(float)radius;




@end

