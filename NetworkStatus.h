//
//  NetworkStatus.h
//  测试用
//
//  Created by 白云杰 on 16/10/26.
//  Copyright © 2016年 白云杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^netStateBlock)(NSInteger netState);

@interface NetworkStatus : NSObject


+ (instancetype)sharedNetManager;

/**
 *  网络监测
 *
 *  @param block 判断结果回调
 *
 *  @return 网络监测
 */
+ (void)netWorkState:(netStateBlock)block;

//+ (void)showWarningView;
//
//+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
