//
//  BaseTableViewCell.h
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
- (void)loadViews;
- (void)layoutViews;

- (void)loadDataWithModel:(id)model withIndexPath:(NSIndexPath *)indexPath;







@end
