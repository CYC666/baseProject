

#import "BaseRTNavigationController.h"
@interface BaseRTNavigationController ()

@end

@implementation BaseRTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //去掉导航栏下面的黑线
    
    self.wcHideBottomBarWhenPush = YES;
    self.useSystemBackBarButtonItem = NO;
    self.transferNavigationBarAttributes = YES;
    
    self.navigationBar.tintColor = White_Color;
    self.navigationBar.barTintColor = Publie_Color;
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:FontB,
                                               NSForegroundColorAttributeName:White_Color};
//    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
//    self.navigationBar.shadowImage = [UIImage imageWithColor:Border_Color withFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.3)];
}







@end
