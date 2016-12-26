//
//  MJViewController.m
//  预习-03-app管理
//
//  Created by MJ Lee on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJAppCell.h"
#import "MJApp.h"

@interface MJViewController () <MJAppCellDelegate>
@property (strong, nonatomic) NSArray *apps;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Money Store";
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (NSArray *)apps
{
    if (_apps == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil]];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJApp *app = [MJApp appWithDict:dict];
            [appArray addObject:app];
        }
        _apps = appArray;
    }
    return _apps;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJAppCell *cell = [MJAppCell appCell:tableView];
    cell.delegate = self;
    cell.app = self.apps[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)appCellDidClickedDownloadBtn:(MJAppCell *)cell
{
    // 1.取出模型
    MJApp *app = cell.app;
    //itms-services://?action=download-manifest&url=https://github.com/licong1991/installIpaFromServer/blob/master/PropertyList.plist
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/licong1991/installIpaFromServer/master/PropertyList.plist"]];
    //https://github.com/licong1991/installIpaFromServer/blob/master/BBPOS%20Pay.ipa?raw=true
    // 2.添加标签
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"成功下载%@", app.name];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.frame = CGRectMake(0, 0, 150, 25);
    label.center = CGPointMake(160, 240);
    label.alpha = 0.0;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    [self.view addSubview:label];
    
    // 3.动画
    [UIView animateWithDuration:0.5 animations:^{
        label.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

@end
