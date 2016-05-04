//
//  HomeViewController.m
//  兼职
//
//  Created by lx on 16/5/3.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "HomeViewController.h"
#import "Masonry.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UIView *kindInfoView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    //自定义顶部标题视图
    [self setNavigationTitleView];
    
    //定义导航栏tableView
    [self kindOfInfoView];
    
}

//自定义顶部标题视图
- (void)setNavigationTitleView{
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    self.navigationItem.titleView = button;
    
    [button setTitle:@"所有信息" forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor lightGrayColor];
    
    [button addTarget:self action:@selector(showTableView:) forControlEvents:UIControlEventTouchUpInside];
    
}

//显示kindInfoView
- (void)showTableView:(UIButton *)sender{
    
    _kindInfoView.hidden = !_kindInfoView.hidden;
    
}


//信息选择视图
- (void)kindOfInfoView{
    
    _kindInfoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    [self.view addSubview:_kindInfoView];
    
    _kindInfoView.hidden = YES;
    
    _kindInfoView.backgroundColor = [UIColor redColor];
    
    [_kindInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.offset(0);
        make.top.offset(60);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(90);
        
    }];
    
    NSArray *titleArray = @[@"所有",@"找兼职",@"招兼职"];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, i * 30, 100, 30)];
        [_kindInfoView addSubview:button];
        
        button.tag = 100 + i;
        
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(kindInfoViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }

}

#warning TODO
//信息选择视图中按钮监听
-  (void)kindInfoViewButtonClick:(UIButton *)sender{
    
    switch (sender.tag - 100) {
        case 0:
            NSLog(@"所有");
            break;
        case 1:
            NSLog(@"找兼职");
            break;
        case 2:
            NSLog(@"招兼职");
            break;
        default:
            break;
    }
    
}

#pragma mark tableView data
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
    
}


@end
