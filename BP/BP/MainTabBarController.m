//
//  MainTabBarController.h
//
//
//  Created by admin on 16/12/16.
//  Copyright © 2026年 曹奕程. All rights reserved.
//

#import "MainTabBarController.h"
#import "YBImageBrowser.h"

@interface MainTabBarController () <YBImageBrowserDataSource> {



}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 黑色字体状态栏
    Status_Light
    
    [UITabBar appearance].translucent = NO;
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TabBarHeight)];
    colorView.backgroundColor = White_Color;
    colorView.layer.shadowOffset = CGSizeMake(0, -3);
    colorView.layer.shadowRadius = 3;
    colorView.layer.shadowOpacity = 0.05;
    colorView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self.tabBar addSubview:colorView];
    
    // 去掉顶部那根线
    UIImage *line = CImage(@"alphaline");
    [self.tabBar setBackgroundImage:line];
    [self.tabBar setShadowImage:line];
    
    
    
    //设置分页的标签
    NSArray *titleName = @[LocalizedString(@"Chat"),
                           LocalizedString(@"Contacts"),
                           LocalizedString(@"News"),
                           LocalizedString(@"Person"),];
    
    //设置
    for (int i = 0; i < self.viewControllers.count; i++) {
        
        BaseRTNavigationController *vc = self.viewControllers[i];
        
        vc.title = titleName[i];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"partA%d", i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"partB%d", i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        // 图片偏移量:
        //vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0);
        
        // 设置title在选择状态下的颜色:
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Publie_Color} forState:UIControlStateSelected];
        
        //设置title的偏移量:
        [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
        

        
    }

}



#pragma mark - 查看大图
- (void)showImageArray:(NSArray *)imageArray currentIndex:(NSInteger)index imageView:(UIImageView *)view {
    
    
    objc_setAssociatedObject(self, @"ShowImageView", view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @"ShowImages", imageArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 设置数据源代理并展示
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSource = self;
    browser.currentIndex = index;
    [browser show];
    
    
}


- (NSUInteger)yb_numberOfCellForImageBrowserView:(YBImageBrowserView *)imageBrowserView {
    
    NSArray *list = objc_getAssociatedObject(self, @"ShowImages");
    return list.count;
    
}


- (id<YBImageBrowserCellDataProtocol>)yb_imageBrowserView:(YBImageBrowserView *)imageBrowserView dataForCellAtIndex:(NSUInteger)index {
    
    NSArray *list = objc_getAssociatedObject(self, @"ShowImages");
    UIImageView *imageView = objc_getAssociatedObject(self, @"ShowImageView");
    
    YBImageBrowseCellData *data = [YBImageBrowseCellData new];
    if ([list[index] isKindOfClass:[NSString class]]) {
        data.url = [NSURL URLWithString:list[index]];
    }
    data.sourceObject = imageView;
    return data;
    
}


























@end
