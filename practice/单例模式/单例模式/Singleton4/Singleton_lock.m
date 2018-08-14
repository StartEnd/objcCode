//
//  Singleton_lock.m
//  单例模式
//
//  Created by Mr.Song on 2018/8/7.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "Singleton_lock.h"

static Singleton_lock   *instance = nil;

@implementation Singleton_lock

static Singleton_lock   *instance = nil;

+ (instancetype)sharedInstance {
    @synchronized(self) {
        instance = [[Singleton_lock alloc] init];
    }
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    if (instance == nil) {
        @synchronized(self) {
            instance = [super allocWithZone:zone];
        }
    }
    return instance;
}
@end
