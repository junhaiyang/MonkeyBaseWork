//
//  BaseTableViewController.h
//  Witclass
//
//  Created by junhai on 16/1/20.
//  Copyright © 2016年 junhai. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)UITableView *mytableView;   //表单视图


- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;

@end
