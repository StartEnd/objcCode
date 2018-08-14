//
//  Singleton_hungry.m
//  单例模式
//
//  Created by Mr.Song on 2018/8/7.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "Singleton_hungry.h"

static Singleton_hungry *instance = nil;

@implementation Singleton_hungry

+ (void)load {
    [Singleton_hungry sharedInstance];
}

+ (instancetype)sharedInstance {
    if (instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [[Singleton_hungry alloc] init];
        });
    }
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    if (instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}

@end
