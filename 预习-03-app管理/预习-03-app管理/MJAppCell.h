//
//  MJAppCell.h
//  预习-03-app管理
//
//  Created by MJ Lee on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJApp, MJAppCell;

@protocol MJAppCellDelegate <NSObject>

@optional
- (void)appCellDidClickedDownloadBtn:(MJAppCell *)cell;
@end

@interface MJAppCell : UITableViewCell

@property (strong, nonatomic) MJApp *app;

@property (weak, nonatomic) id<MJAppCellDelegate> delegate;

+(instancetype)appCell:(UITableView *)tableView;

@end
