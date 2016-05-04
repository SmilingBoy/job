//
//  HomeMsgInfo.h
//  兼职
//
//  Created by lx on 16/5/4.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    ZQMessageTypeMe = 0,
    ZQMessageTypeOther = 1
} ZQMessageType;

@interface HomeMsgInfo : NSObject

@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *image;
//信息类型
@property (nonatomic, assign)ZQMessageType type;
//酬劳
@property (nonatomic, strong)NSString *salary;
//工作类型
@property (nonatomic, strong)NSString *workType;

@end
