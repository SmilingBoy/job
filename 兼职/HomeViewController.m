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

@property (nonatomic, strong)UIImageView *menu;
//消息列表
@property (nonatomic, strong)UITableView *msgTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    
    //消息列表
    _msgTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_msgTableView];
    
    _msgTableView.delegate = self;
    _msgTableView.dataSource = self;
    _msgTableView.backgroundColor = [UIColor clearColor];
    
    
    
    //自定义顶部标题视图
    [self setNavigationTitleView];

    
}

//自定义顶部标题视图
- (void)setNavigationTitleView{
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.navigationItem.titleView = button;
    
    [button setTitle:@"所有信息" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 *  懒加载menu
 *
 */
-(UIImageView *)menu{
    
    if (!_menu) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 65, 100, 100)];
        
        
        CGPoint center = imageView.center;
        center.x = [UIScreen mainScreen].bounds.size.width/2.0;
        imageView.center = center;
        
        [imageView setImage:[UIImage imageNamed:@"popover_background"]];
        
        _menu = imageView;
        
        //添加内部按钮
        NSArray *titileArray = @[@"全部信息",@"找兼职",@"招兼职"];
        
        for (int i = 0; i < 3; i++) {
            
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, i * 30 + 10, _menu.frame.size.width, 30)];
            
            [button setTitle:titileArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_menu addSubview:button];
            
        }
        
        
        [self.view addSubview:_menu];
        
    }
    
    return _menu;
    
}

/**
 *  点击标题
 */
- (void)titleButtonClick:(UIButton *)sender{
    
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        self.menu.hidden = NO;
    }else{
        _menu.hidden = YES;
    }
    
    
}


//#warning TODO
//信息选择视图中按钮监听
-  (void)menuButtonClick:(UIButton *)sender{
    
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
    
    return 30;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuserIndentiFier = @"reuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIndentiFier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserIndentiFier];
        
    }
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
    
}


@end
