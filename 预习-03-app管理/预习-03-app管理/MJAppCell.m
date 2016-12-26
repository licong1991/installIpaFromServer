//
//  MJAppCell.m
//  预习-03-app管理
//
//  Created by MJ Lee on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAppCell.h"
#import "MJApp.h"

@interface MJAppCell()

@property (weak, nonatomic)  UIImageView *iconView;

@property (weak, nonatomic)  UILabel *nameView;

@property (weak, nonatomic)  UIButton *downloadView;

@property (weak, nonatomic)  UILabel *introView;

@property(weak,nonatomic)   UIView *bottomLine;

@end

@implementation MJAppCell

+(instancetype)appCell:(UITableView *)tableView{
    static NSString *ID = @"APPCELL";
    MJAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell=[[MJAppCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UIImageView *iconView=[[UIImageView alloc]init];
        iconView.layer.cornerRadius = 5;
        iconView.layer.masksToBounds=YES;
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        iconView.backgroundColor=[UIColor clearColor];
        
        UILabel * nameView=[[UILabel alloc]init];
        nameView.font=[UIFont systemFontOfSize:12];
        nameView.textColor=[UIColor blackColor];
        self.nameView=nameView;
        [self.contentView addSubview:nameView];
        
        UILabel * introView=[[UILabel alloc]init];
        introView.font=[UIFont systemFontOfSize:10];
        introView.textColor=[UIColor blackColor];
        self.introView=introView;
        [self.contentView addSubview:introView];
        
        UIButton *downLoadBtn = [[UIButton alloc]init];
        [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateNormal];
         [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateDisabled];
        [downLoadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [downLoadBtn setTitle:@"已下载" forState:UIControlStateDisabled];
        downLoadBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [downLoadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [downLoadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [downLoadBtn addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
        self.downloadView = downLoadBtn;
        [self.contentView addSubview:downLoadBtn];
        
        UIView * bottomLine=[[UIView alloc]init];
        bottomLine.backgroundColor=HJColor(0xcccccc);
        self.bottomLine = bottomLine;
        [self.contentView addSubview:bottomLine];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat padding=10;
    
    CGFloat imgX=padding;
    CGFloat imgY=padding;
    CGFloat imgW=60;
    CGFloat imgH=60;
    self.iconView.frame=CGRectMake(imgX, imgY, imgW, imgH);
    
    CGFloat nameViewX=CGRectGetMaxX(self.iconView.frame)+padding;
    CGFloat nameViewY=padding;
    CGFloat nameViewW=200;
    CGFloat nameViewH=25;
    self.nameView.frame=CGRectMake(nameViewX, nameViewY, nameViewW, nameViewH);
    
    self.introView.frame=CGRectMake(nameViewX, 45, 200, 25);
    
    self.downloadView.frame=CGRectMake(self.contentView.frame.size.width-80, 25, 60, 30);
    
    self.bottomLine.frame=CGRectMake(0, self.contentView.frame.size.height-1, self.contentView.frame.size.width, 0.5);
}


- (void)setApp:(MJApp *)app
{
    _app = app;
    
    self.iconView.image = [UIImage imageNamed:app.icon];
    self.nameView.text = app.name;
    self.introView.text = [NSString stringWithFormat:@"大小:%@ | 下载量:%@", app.size, app.download];
    
    self.downloadView.enabled = !app.isDownloaded;
}

- (void)downloadClick {
    // 1.按钮失效
    self.downloadView.enabled = NO;
    self.app.downloaded = YES;
    
    // 2.通知代理
    if ([self.delegate respondsToSelector:@selector(appCellDidClickedDownloadBtn:)]) {
        [self.delegate appCellDidClickedDownloadBtn:self];
    }
}
@end
