//
//  ZQButton.m
//  兼职
//
//  Created by lx on 16/5/3.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ZQButton.h"

@interface ZQButton ()

@property (strong, nonatomic)UIImageView *subImageView;
@property (strong, nonatomic)UILabel *subLale;

//存储按钮状态图片
@property (strong, nonatomic)UIImage *normalImage;
@property (strong, nonatomic)UIImage *selectedImage;

@end

@implementation ZQButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _subImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height * 0.7)];
        [self addSubview:_subImageView];
        _subImageView.contentMode = UIViewContentModeCenter;
        
        _subLale = [[UILabel alloc]initWithFrame:CGRectMake(0, _subImageView.frame.size.height, frame.size.width, frame.size.height * 0.3)];
        [self addSubview:_subLale];
        
        //设置label,文字居中,字号14,字体颜色白色
        _subLale.textAlignment = NSTextAlignmentCenter;
        _subLale.font = [UIFont systemFontOfSize:14];
        _subLale.textColor = [UIColor whiteColor];
        
        _subLale.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
    }
    return self;
}


//设置标题
-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    
    _subLale.text = title;
    
}

//设置图片
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    
    if (state == UIControlStateNormal) {
        
        _normalImage = image;
        
    }
    if (state == UIControlStateSelected) {
        
        _selectedImage = image;
        
    }
    
}


//选中状态
-(void)setSelected:(BOOL)selected{
    
    if (selected) {
        
        _subImageView.image = _selectedImage;
        
    }else{
        
        _subImageView.image = _normalImage;
        
    }
    
}















@end
