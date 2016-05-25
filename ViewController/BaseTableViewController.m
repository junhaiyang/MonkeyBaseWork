//
//  BaseTableViewController.m
//  Witclass
//
//  Created by junhai on 16/1/20.
//  Copyright © 2016年 junhai. All rights reserved.
//

#import "BaseTableViewController.h"
#import "UIScrollView+EmptyDataSet.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HIGHT [UIScreen mainScreen].bounds.size.height
@interface BaseTableViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColorFromRGB(0xafafaf)];
    [self.view addSubview:self.mytableView];
    // Do any additional setup after loading the view. 
}

-(UITableView *)mytableView
{
    if (!_mytableView) {
        _mytableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mytableView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HIGHT-64);
        _mytableView.delegate=self;
        _mytableView.dataSource=self;
        _mytableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _mytableView.emptyDataSetSource = self;
        _mytableView.emptyDataSetDelegate = self;
    }
    return _mytableView;
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:12.0f],
                                NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:@"暂无数据~"  attributes:attribute];
}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIColor whiteColor];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -self.mytableView.bounds.size.height/2.0f +50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
