//
//  Singleton_thread.m
//  单例模式
//
//  Created by Mr.Song on 2018/8/7.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "Singleton_thread.h"
//1. 提供一个静态实例变量,赋值为nil


@implementation Singleton_thread

Singleton_thread *instanse = nil;

+ (instancetype)sharedInstance {
    //gcd线程安全
    static dispatch_once_t onceTonken;
    dispatch_once(&onceTonken, ^{
        instanse = [[self alloc] init];
    });
    return instanse;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    if(instanse == nil) {
        static dispatch_once_t onceTonken;
        dispatch_once(&onceTonken, ^{
            instanse = [super allocWithZone:zone];
        });
    }
    return instanse;
}
@end
