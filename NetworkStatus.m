//
//  NetworkStatus.m
//  测试用
//
//  Created by 白云杰 on 16/10/26.
//  Copyright © 2016年 白云杰. All rights reserved.
//

#import "NetworkStatus.h"

/**
 AFNetworkReachabilityStatusUnknown          = -1,  // 未知
 AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
 AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
 AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
 */

@implementation NetworkStatus

#pragma mark - 网络监测
+ (instancetype)sharedNetManager {
    static dispatch_once_t once;
    static NetworkStatus *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark----网络检测
+ (void)netWorkState:(netStateBlock)block {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
//    __block typeof(self) bself = self;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status== 0 || status == -1) {
//            [bself showWarningView];
            block(status);
        }else{
            block(status);
        }
    }];
}

//#pragma mark---网络断开时弹出提示框
//+ (void)showWarningView {
//    UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络断开，请检查网络设置" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
//    [alter show];
//}
//
//#pragma mark---alertView点击事件
//+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex==0) {
//        NSLog(@"取消");
//    }else{
//        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
//    }
//}

@end
