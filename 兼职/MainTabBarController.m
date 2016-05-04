//
//  MainTabBarController.m
//  兼职
//
//  Created by lx on 16/5/3.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "BusinessViewController.h"
#import "AddMsgViewController.h"
#import "MessageViewController.h"
#import "MeViewController.h"
#import "ZQButton.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    NSMutableArray *viewControllerArray = [NSMutableArray array];
    
    HomeViewController *homeViewController = [[HomeViewController alloc]init];
    [viewControllerArray addObject:[[UINavigationController alloc]initWithRootViewController:homeViewController]];

    BusinessViewController *businessViewController = [[BusinessViewController alloc]init];
    [viewControllerArray addObject:[[UINavigationController alloc]initWithRootViewController:businessViewController]];
    
    AddMsgViewController *addMsgViewController = [[AddMsgViewController alloc]init];
    [viewControllerArray addObject:[[UINavigationController alloc]initWithRootViewController:addMsgViewController]];
    
    MessageViewController *messageViewController = [[MessageViewController alloc]init];
    [viewControllerArray addObject:[[UINavigationController alloc]initWithRootViewController:messageViewController]];
    
    MeViewController *meViewController = [[MeViewController alloc]init];
    [viewControllerArray addObject:[[UINavigationController alloc]initWithRootViewController:meViewController]];
    
    self.viewControllers = viewControllerArray;
    
}

-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    [super setViewControllers:viewControllers];
    
    //移除tabbar上的所有控件
    for (UIView *subView in self.tabBar.subviews) {
        [subView removeFromSuperview];
    }
    
    //标题和图片数组
    NSArray *titleArray = @[@"首页",@"店铺",@"+",@"消息",@"我"];
    NSArray *imageArray = @[@"home",@"store",@"myinfo",@"payticket",@"myinfo"];
    
    //在tabBar上添加自定义按钮
    for (int i = 0; i < viewControllers.count; i++) {
        
        ZQButton *button = [[ZQButton alloc]initWithFrame:CGRectMake(self.tabBar.frame.size.width/5.0 * i, 0, self.tabBar.frame.size.width/5.0, self.tabBar.frame.size.height)];
        
        [self.tabBar addSubview:button];
        
        //设置button的tag
        button.tag = 100 + i;
        
        //设置标题
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        //设置图片
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_on",imageArray[i]]] forState:UIControlStateSelected];
        
        //选中状态为No
        button.selected = NO;
        
        //设置第一个按钮为选中状态
        if(i == 0){
            button.selected = YES;
        }
        
        //按钮监听事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}


//tabBar上自定义按钮监听
- (void)buttonClick:(ZQButton *)sender{
    
    //将所有按钮选中状态改为NO
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isMemberOfClass:[ZQButton class]]) {
            
            ZQButton *button = (ZQButton *)view;
            
            button.selected = NO;
            
        }
        
    }
    
    //被点击的按钮设置为YES
    sender.selected = YES;
    
    //设置显示的viewController
    self.selectedIndex = sender.tag - 100;
    
}



@end
