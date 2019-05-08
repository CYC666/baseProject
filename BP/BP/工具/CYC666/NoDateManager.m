//
//  NoDateManager.m
//  skZone
//
//  Created by sm on 2019/4/17.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "NoDateManager.h"

@implementation NoDateManager


+ (void)setNoDateView:(UITableView *)tableView list:(NSArray *)list dataList:(NSArray *)dataList {
    
    
    // 没有数据的视图
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (list.count > 0) {
            [tableView.mj_footer endRefreshing];
        } else {
            [tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [tableView.mj_header endRefreshing];
        
        if (dataList.count == 0) {
            
            UIView *cycNoData = objc_getAssociatedObject(self, @"cycNoData");
            if (!cycNoData) {
                
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                view.backgroundColor = Background_Color;
                
                //图标
                UIImageView *noDataImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"暂无收益数据"]];
                noDataImage.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 - 150);
                [view addSubview:noDataImage];
                [tableView addSubview:view];
                
                objc_setAssociatedObject(tableView, @"cycNoData", view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            
        } else {
            
            UIView *cycNoData = objc_getAssociatedObject(tableView, @"cycNoData");
            if (cycNoData) {
                [cycNoData removeFromSuperview];
                cycNoData = nil;
            }
            
        }
        
        [tableView reloadData];
        
    });
    
    
    
}




@end
